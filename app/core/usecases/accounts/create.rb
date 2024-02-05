# frozen_string_literal: true

class Accounts::Create < BaseUsecase
  def call
    user = User.new({
      name: @params[:name],
      document: @params[:document],
      email: @params[:email],
      password: @params[:password]
    })

    raise InvalidParams, "Invalid params to create a new user" unless user.valid?

    AccountRepository.create(user, @params.fetch(:kind, nil))
  end
end
