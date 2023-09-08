# frozen_string_literal: true

accounts_controller = AccountsController.new
transactions_controller = TransactionsController.new

get '/' do
  { msg: 'Hello to the Poc Pay' }.to_json
end

post '/accounts' do
  request.body.rewind  # in case someone already read it
  params = JSON.parse request.body.read
  { data: accounts_controller.create(params) }.to_json
rescue StandardError
  404
end

post '/transactions' do
  request.body.rewind  # in case someone already read it
  params = JSON.parse request.body.read
  { data: transactions_controller.create(params) }.to_json
rescue StandardError => e
  puts "[Error] #{e.message}"
  404
end

error 404 do
  { error: 'Invalid Params' }.to_json
end

