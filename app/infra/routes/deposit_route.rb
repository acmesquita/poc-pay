# frozen_string_literal: true

post '/deposit' do
  request.body.rewind
  params = JSON.parse request.body.read
  data = DepositSerializer.format(DepositsController.create(params))

  { data: data }.to_json
rescue InvalidTransaction => e
  puts "[Error] #{e.message}"
  error = "[Invalid Transaction]: #{e.message}"
  Rack::Response.new({ error: error }.to_json, 404, {}).finish
end
