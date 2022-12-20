# frozen_string_literal: true

class ChangeColumnRole < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, using: 'role::integer'
  end
end
