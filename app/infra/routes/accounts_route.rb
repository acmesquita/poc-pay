# frozen_string_literal: true

accounts_controller = AccountsController.new

post '/accounts' do
  request.body.rewind
  params = JSON.parse request.body.read
  { data: AccountSerializer.new(accounts_controller.create(params)).format }.to_json
rescue InvalidParams => e
  puts "[Error] #{e.message}"
  Rack::Response.new({ error: "[Invalid Transaction]: #{e.message}" }.to_json, 404, {}).finish
end
