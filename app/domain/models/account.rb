# frozen_string_literal: true

class Account < ActiveRecord::Base
  belongs_to :user

  enum kind: {
    commom: 'common',
    merchant: 'merchant'
  }
end
