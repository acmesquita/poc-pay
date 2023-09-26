# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :name, :document, :email, :password, presence: true
  validates :document, :email, uniqueness: { case_sensitive: false }
end
