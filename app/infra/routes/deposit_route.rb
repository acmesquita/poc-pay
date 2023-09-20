# frozen_string_literal: true

deposit_controller = DepositsController.new

post '/deposit' do
  request.body.rewind
  params = JSON.parse request.body.read
  { data: DepositSerializer.new(deposit_controller.create(params)).format }.to_json
rescue InvalidTransaction => e
  puts "[Error] #{e.message}"
  Rack::Response.new({ error: "[Invalid Transaction]: #{e.message}" }.to_json, 404, {}).finish
end
