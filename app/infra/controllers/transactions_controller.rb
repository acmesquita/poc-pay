# frozen_string_literal: true

class TransactionsController
  def create(params)
    Accounts::Transactions.call({
      value: params['value'],
      sender: params['sender'],
      receiver: params['receiver']
    })
  end
end
