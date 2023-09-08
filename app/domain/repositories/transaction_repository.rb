# frozen_string_literal: true

class TransactionRepository
  def self.create(sender, receiver, amount)
    Transaction.create!(
      sender: sender,
      receiver: receiver,
      amount: amount
    )
  end
end
