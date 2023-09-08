# frozen_string_literal: true

require 'rest-client'
require 'spec_helper'

RSpec.describe 'TransactionsTest' do
  context 'when params provider invalid params' do
    subject(:sub) { Accounts::Transactions }

    let(:sender) do
      user = User.create({
        name: 'Fulano',
        document: '1235667490',
        email: 'xpto123@email.com',
        password: '1234256'
      })

      Account.create(user: user, kind: 'common', balance: 1000)
    end

    let(:receiver) do
      user = User.create({
        name: 'Loja',
        document: '010010010000101',
        email: 'loja123@email.com',
        password: '1234256'
      })

      Account.create(user: user, kind: 'merchant')
    end

    it 'throw a error (InvalidTransaction) if sender not found' do
      expect do
        sub.call({
          value: 100.00,
          sender: '0004',
          receiver: '0015'
        })
      end.to raise_error(InvalidTransaction, 'Account nº 0004 not found')
    end

    it 'throw a error (InvalidTransaction) if receiver not found' do
      expect do
        sub.call({
          value: 100.00,
          sender: sender.public_id,
          receiver: '0015'
        })
      end.to raise_error(InvalidTransaction, 'Account nº 0015 not found')
    end

    it 'throw a error (InvalidTransaction) if reciever with kind merchant try transfer' do
      expect do
        sub.call({
          value: 100.00,
          sender: receiver.public_id,
          receiver: sender.public_id
        })
      end.to raise_error(InvalidTransaction, "Merchant can't be transaction")
    end

    it 'throw a error (InvalidTransaction) if sender no have waithdraw' do
      expect do
        sub.call({
          value: 5000.00,
          sender: sender.public_id,
          receiver: receiver.public_id
        })
      end.to raise_error(InvalidTransaction,
        "Account nº #{sender.public_id} can't be transaction for not found balance")
    end

    it 'throw a error (InvalidTransaction) if no authorized' do
      response = double
      response.stub(:code) { 404 }
      response.stub(:headers) { '' }
      response.stub(:body) { { message: 'Não Autorizado' }.to_json }
      RestClient.stub(:get) { response }

      expect do
        sub.call({
          value: 100.00,
          sender: sender.public_id,
          receiver: receiver.public_id
        })
      end.to raise_error(InvalidTransaction, 'Transaction not authorized')
    end
  end

  context 'when provice valid params' do
    subject(:sub) do
      Accounts::Transactions.call({
        value: 100.00,
        sender: sender.public_id,
        receiver: receiver.public_id
      })
    end

    let(:sender) do
      user = User.create({
        name: 'Fulano',
        document: '1235667490',
        email: 'xpto123@email.com',
        password: '1234256'
      })

      Account.create(user: user, kind: 'common', balance: 1000)
    end

    let(:receiver) do
      user = User.create({
        name: 'Loja',
        document: '010010010000101',
        email: 'loja123@email.com',
        password: '1234256'
      })

      Account.create(user: user, kind: 'merchant')
    end

    before do
      response = double
      response.stub(:code) { 200 }
      response.stub(:headers) { '' }
      response.stub(:body) { { message: 'Autorizado' }.to_json }
      RestClient.stub(:get) { response }
    end

    it 'account update sender balances' do
      sub
      sender.reload
      expect(sender.balance.to_s).to eq('900.0')
    end

    it 'account update receiver balances' do
      sub
      receiver.reload
      expect(receiver.balance.to_s).to eq('100.0')
    end
  end
end
