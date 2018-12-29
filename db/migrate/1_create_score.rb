# frozen_string_literal: true

class CreateScore < ActiveRecord::Migration[5.0]
  def change
    create_table :scores, id: :uuid do |field|
      field.string :user_id
      field.integer :rate
      field.text :comment
      field.string :source
      field.datetime :created_at
    end

    add_index :scores, [:id], unique: true
    add_index :scores, [:rate]
    add_index :scores, [:created_at]
  end
end
