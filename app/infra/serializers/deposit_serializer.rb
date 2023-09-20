# frozen_string_literal: true

class DepositSerializer
  def initialize(params)
    @params = params
  end

  def format
    {
      uid: @params.public_id,
      balance: @params.balance
    }
  end
end
