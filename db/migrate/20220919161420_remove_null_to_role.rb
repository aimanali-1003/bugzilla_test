# frozen_string_literal: true

class RemoveNullToRole < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :role, true
  end
end
