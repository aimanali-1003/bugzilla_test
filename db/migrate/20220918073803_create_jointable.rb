# frozen_string_literal: true

class CreateJointable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :projects, &:timestamps
  end
end
