# frozen_string_literal: true

class AddColumnnummOfBugs < ActiveRecord::Migration[5.2]
  def change
    change_column_null :bugs, :assigned_to_id, true
  end
end
