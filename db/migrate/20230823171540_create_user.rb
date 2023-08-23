# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :document, unique: true
      t.string :email, unique: true
      t.string :password
      t.timestamps
    end
  end
end
