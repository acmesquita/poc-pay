# frozen_string_literal: true

class AddPublicId < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :public_id, :string, unique: true, default: '0000', null: false
  end
end
