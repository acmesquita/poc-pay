# frozen_string_literal: true

require 'rest-client'
require 'spec_helper'

RSpec.describe 'DepositTest' do
  subject(:sub) { Accounts::Deposit }

  let(:account) do
    user = User.create({
      name: 'Fulano',
      document: '1235667490',
      email: 'xpto123@email.com',
      password: '1234256'
    })

    Account.create(user: user, kind: 'common', balance: 1000)
  end

  context 'when params provider invalid value' do
    it 'throw InvalidTransaction' do
      expect do
        sub.call({
          value: -100.0,
          account_number: account.public_id
        })
      end.to raise_error(InvalidTransaction, 'Value invalid.')
    end
  end

  context 'when params provider invalid account' do
    it 'throw InvalidTransaction' do
      expect do
        sub.call({
          value: 100.0,
          account_number: 'invalid_id'
        })
      end.to raise_error(InvalidTransaction, 'Invalid account.')
    end
  end

  context 'when params provider correctly values' do
    it 'can be deposit' do
      result = sub.call({
        value: 100.0,
        account_number: account.public_id
      })

      expect(result.balance).to eq(1100)
    end
  end
end
