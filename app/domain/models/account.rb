# frozen_string_literal: true

class Account < ActiveRecord::Base
  after_create :generete_public_id
  belongs_to :user

  enum kind: {
    commom: 'common',
    merchant: 'merchant'
  }

  validates :balance, presence: true
  validates :kind, presence: true

  def generete_public_id
    self.public_id = (SecureRandom.random_number * 10_000).round.to_s.rjust(4, '0')
  end
end
