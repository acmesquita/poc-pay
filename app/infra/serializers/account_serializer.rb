# frozen_string_literal: true

class AccountSerializer
  def initialize(params)
    @params = params
  end

  def format
    {
      account_number: @params.public_id,
      name: @params.user.name,
      balance: @params.balance
    }
  end
end
