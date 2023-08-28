# frozen_string_literal: true

# require_relative '../../domain/models/user'
# require_relative '../../domain/errors/invalid_params'
# require_relative '../../domain/repositories/account'

class Accounts::Create
  def initialize(params)
    @params = params
  end

  def self.call(params)
    new(params).call
  end

  def call
    user = User.new({
      name: @params[:name],
      document: @params[:document],
      email: @params[:email],
      password: @params[:password]
    })

    raise InvalidParams, 'Invalid params to create a new user' unless user.valid?

    AccountRepository.create(user, @params.fetch(:kind, nil))
  end
end
