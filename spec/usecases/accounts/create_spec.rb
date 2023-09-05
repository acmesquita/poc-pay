# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'CreateTest' do
  context 'when params provider correctly' do
    subject(:sub) { Accounts::Create }

    it 'returns a new account with id' do
      result = sub.call({
        name: 'Fulano',
        document: '1234567903',
        email: 'xpto432@email.com',
        password: '123456'
      })

      expect(result.id).not_to be_nil
    end

    it 'returns a new user with id' do
      result = sub.call({
        name: 'Fulano',
        document: '1234567903',
        email: 'xpto432@email.com',
        password: '123456'
      })

      expect(result.user_id).not_to be_nil
    end

    it 'returns a account without kind provider' do
      result = sub.call({
        name: 'Fulano',
        document: '1234567903',
        email: 'xpto432@email.com',
        password: '123456'
      })

      expect(result.kind).to eq('commom')
    end

    it 'returns a account with kind provider' do
      result = sub.call({
        name: 'Fulano',
        document: '1234567903',
        email: 'xpto432@email.com',
        password: '123456',
        kind: 'merchant'
      })

      expect(result.kind).to eq('merchant')
    end

    it 'returns a account with public_id random' do
      result = sub.call({
        name: 'Fulano',
        document: '1234567903',
        email: 'xpto432@email.com',
        password: '123456',
        kind: 'merchant'
      })

      expect(result.public_id).not_to eq('0000')
    end
  end

  context 'when params provider incorrectly' do
    subject(:sub) { Accounts::Create }

    it 'throws InvalidaParams error' do
      expect { sub.call({}) }.to raise_error InvalidParams
    end
  end

  context 'when try insert two user with same document' do
    subject(:sub) { Accounts::Create }

    it 'throws InvalidaParams error' do
      sub.call({
        name: 'Fulano',
        document: '1234567901',
        email: 'xpto@email.com',
        password: '123456'
      })
      expect do
        sub.call({
          name: 'Fulano 2',
          document: '1234567901',
          email: 'xpto2@email.com',
          password: '12345678'
        })
      end.to raise_error InvalidParams
    end
  end

  context 'when try insert two user with same email' do
    subject(:sub) { Accounts::Create }

    it 'throws InvalidaParams error' do
      sub.call({
        name: 'Fulano',
        document: '1234567902',
        email: 'xpto@email.com',
        password: '123456'
      })
      expect do
        sub.call({
          name: 'Fulano 2',
          document: '1234567901',
          email: 'xpto@email.com',
          password: '12345678'
        })
      end.to raise_error InvalidParams
    end
  end
end
