# frozen_string_literal: true

class CreateAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :kind, default: 'common', null: false
      t.decimal :balancer, default: 0, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
