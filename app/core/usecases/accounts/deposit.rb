# frozen_string_literal: true

class Accounts::Deposit < BaseUsecase
  def call
    amount = @params[:value]
    public_id = @params[:account_number]

    raise InvalidTransaction, "Value invalid." if amount <= 0

    account = AccountRepository.find_by_public_id(public_id)

    raise InvalidTransaction, "Invalid account." if account.nil?

    raise InvalidTransaction, "Error transaction, try again" unless create_transaction(account, account, amount)

    account
  end

  private

  def create_transaction(sender, receiver, amount)
    @transaction = TransactionRepository.create(sender, receiver, amount)
  end
end
