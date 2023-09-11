# frozen_string_literal: true

transactions_controller = TransactionsController.new

post '/transactions' do
  request.body.rewind
  params = JSON.parse request.body.read
  { data: TransactionSerializer.new(transactions_controller.create(params)).format }.to_json
rescue InvalidTransaction => e
  puts "[Error] #{e.message}"
  Rack::Response.new({ error: "[Invalid Transaction]: #{e.message}" }.to_json, 404, {}).finish
end
