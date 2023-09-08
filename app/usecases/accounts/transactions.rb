# frozen_string_literal: true

class Accounts::Transactions < BaseUsecase
  def call
    @public_id_sender = @params[:sender]
    @public_id_receiver = @params[:receiver]
    @amount = @params[:value]

    @sender = AccountRepository.find_by_public_id(@public_id_sender)

    sender_valid?

    @receiver = AccountRepository.find_by_public_id(@public_id_receiver)

    raise InvalidTransaction, "Account nº #{@public_id_receiver} not found" if @receiver.nil?
    raise InvalidTransaction, 'Transaction not authorized' unless authorized?

    raise InvalidTransaction, 'Error transaction, try again' unless create_transaction(@sender, @receiver, @amount)

    send_notify

    @transaction
  end

  private

  def authorized?
    response = ApiClient::Request.get('https://run.mocky.io/v3/8fafdd68-a090-496f-8c9a-3442cf30dae6')
    response[:body]['message'] == 'Autorizado'
  end

  def create_transaction(sender, receiver, amount)
    @transaction = TransactionRepository.create(sender, receiver, amount)
  end

  def sender_valid?
    raise InvalidTransaction, "Account nº #{@public_id_sender} not found" if @sender.nil?
    raise InvalidTransaction, "Merchant can't be transaction" if @sender.merchant?

    return false unless @sender.balance < @amount

    raise InvalidTransaction,
      "Account nº #{@public_id_sender} can't be transaction for not found balance"
  end

  def send_notify
    puts 'Send email'
  end
end
