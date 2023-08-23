# frozen_string_literal: true

class User
  attr_reader :id, :name, :email, :password, :document

  def initialize(params)
    @id = nil
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    @document = params[:document]
  end

  def valid?
    !(be_nil? || blank?)
  end

  def blank?
    @name.empty? || @email.empty? || @password.empty? || @document.empty?
  end

  def be_nil?
    @name.nil? || @email.nil? || @password.nil? || @document.nil?
  end

  def to_hash
    {
      name: @name,
      email: @email,
      password: @password,
      document: @document
    }
  end
end
