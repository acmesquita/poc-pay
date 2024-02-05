# frozen_string_literal: true

class BaseSerializer
  def initialize(params)
    @params = params
  end

  def self.format(params)
    new(params).format
  end

  def format
    raise NoMethodError, "method should be implemented in concrete class"
  end
end
