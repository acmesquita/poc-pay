# frozen_string_literal: true

class Account < ActiveRecord::Base
  before_create :generete_public_id
  belongs_to :user
  has_many :credit_transactions, class_name: "Transaction", foreign_key: "sender_id"
  has_many :debit_transactions, class_name: "Transaction", foreign_key: "receiver_id"

  enum kind: {
    commom: "common",
    merchant: "merchant"
  }

  validates :balance, presence: true
  validates :kind, presence: true

  def generete_public_id
    self.public_id = (SecureRandom.random_number * 10_000).round.to_s.rjust(4, "0")
  end
end
