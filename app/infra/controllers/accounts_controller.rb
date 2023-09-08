# frozen_string_literal: true

class AccountsController
  def create(params)
    Accounts::Create.call({
      name: params['name'],
      document: params['document'],
      email: params['email'],
      password: params['password'],
      kind: params['kind']
    })
  end
end
