# frozen_string_literal: true

require_relative '../models/user'

class UserRepository < User
  self.table_name = 'users'

  def self.create(user)
    user.save!
    user
  end
end
