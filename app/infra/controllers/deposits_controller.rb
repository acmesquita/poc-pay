# frozen_string_literal: true

class DepositsController
  def create(params)
    Accounts::Deposit.call({
      value: params['value'],
      account_number: params['account_number']
    })
  end
end
