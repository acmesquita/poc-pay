# frozen_string_literal: true

class UserRepository
  def self.create(user)
    user.save!
    user
  end
end
