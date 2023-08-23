# frozen_string_literal: true

class UserRepository < ActiveRecord::Base
  self.table_name = 'users'

  validates :name, :document, :email, :password, presence: true
  validates :document, :email, uniqueness: { case_sensitive: false }
end
