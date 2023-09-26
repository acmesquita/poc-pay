# frozen_string_literal: true

class DepositSerializer < BaseSerializer
  def format
    {
      uid: @params.public_id,
      balance: @params.balance
    }
  end
end
