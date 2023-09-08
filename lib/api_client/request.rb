# frozen_string_literal: true

require 'rest-client'

class ApiClient::Request
  DEFAULT_HEARDER = { content_type: :json, accept: :json }.freeze

  def self.get(url, headers: {})
    response = RestClient.get url, DEFAULT_HEARDER.merge(headers)

    compose_response(response)
  end

  def self.compose_response(response)
    {
      code: response.code,
      headers: response.headers,
      body: deserialize(response.body)
    }
  end

  def self.deserialize(body)
    JSON.parse(body) rescue body
  end
end
