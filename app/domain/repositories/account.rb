# frozen_string_literal: true

require_relative '../models/account'
require_relative 'user'

class AccountRepository
  def self.create(user, kind)
    UserRepository.create(user)
    kind = 'common' if kind.nil?
    Account.create!(user_id: user.id, kind: kind)
  end
end
