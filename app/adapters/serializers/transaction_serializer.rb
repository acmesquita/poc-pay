# frozen_string_literal: true

class TransactionSerializer < BaseSerializer
  def format
    {
      uid: @params.public_id,
      sender: @params.sender.user.name,
      receiver: @params.receiver.user.name,
      value: @params.amount
    }
  end
end
