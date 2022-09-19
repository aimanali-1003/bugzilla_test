# frozen_string_literal: true

class AddIndexToBugs < ActiveRecord::Migration[5.2]
  def change
    add_index :bugs, :title
  end
end
