# frozen_string_literal: true

class Transaction < ActiveRecord::Base
  before_create :generete_public_id
  before_create :update_balances

  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Account'

  validates :amount, numericality: { greater_than: 0 }

  private

  def generete_public_id
    self.public_id = SecureRandom.uuid
  end

  def update_balances
    sender.balance -= amount
    sender.save!
    receiver.balance += amount
    receiver.save!
  end
end
