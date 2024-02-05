# frozen_string_literal: true

class AccountRepository
  def self.create(user, kind)
    UserRepository.create(user)
    kind = "common" if kind.nil?
    Account.create!(user_id: user.id, kind: kind)
  end

  def self.find_by_public_id(public_id)
    Account.find_by(public_id: public_id)
  end
end
