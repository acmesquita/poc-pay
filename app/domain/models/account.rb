# frozen_string_literal: true

class Account < ActiveRecord::Base
  belongs_to :user

  enum kind: {
    commom: 'common',
    merchant: 'merchant'
  }

  validates :balance, presence: true
  validates :kind, presence: true, inclusion: { in: Account.kinds.keys }
end
