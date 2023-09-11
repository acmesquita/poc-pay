# frozen_string_literal: true

require_relative 'routes/accounts_route'
require_relative 'routes/transactions_route'

get '/' do
  { msg: 'Hello to the Poc Pay' }.to_json
end

error 500 do
  Rack::Response.new([], 500, { error: 'Try again.' }).finish
end
