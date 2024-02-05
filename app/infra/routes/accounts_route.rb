# frozen_string_literal: true

post "/accounts" do
  request.body.rewind
  params = JSON.parse request.body.read
  data = AccountSerializer.format(AccountsController.create(params))

  { data: data }.to_json
rescue InvalidParams => e
  puts "[Error] #{e.message}"
  error = "[Invalid Transaction]: #{e.message}"
  Rack::Response.new({ error: error }.to_json, 404, {}).finish
end
