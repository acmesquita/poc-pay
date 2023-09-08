# frozen_string_literal: true

class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.decimal :amount
      t.string :public_id

      t.timestamps
    end
  end
end
