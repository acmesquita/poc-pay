# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../app/usecases/users/create'
require_relative '../../../app/domain/errors/invalid_params'

RSpec.describe 'CreateTest' do
  context 'when params provider correctly' do
    subject(:sub) { Users::Create }

    it 'returns a new user with id' do
      result = sub.call({
        name: 'Fulano',
        document: '1234567903',
        email: 'xpto432@email.com',
        password: '123456'
      })

      expect(result.id).not_to be_nil
    end
  end

  context 'when params provider incorrectly' do
    subject(:sub) { Users::Create }

    it 'throws InvalidaParams error' do
      expect { sub.call({}) }.to raise_error InvalidParams
    end
  end

  context 'when try insert two user with same document' do
    subject(:sub) { Users::Create }

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
    subject(:sub) { Users::Create }

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
