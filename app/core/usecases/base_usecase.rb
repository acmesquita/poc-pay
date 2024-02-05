# frozen_string_literal: true

class BaseUsecase
  def initialize(params)
    @params = params
  end

  def self.call(params)
    new(params).call
  end

  def call
    raise NoMethodError, "method should be implemented in concrete class"
  end
end
