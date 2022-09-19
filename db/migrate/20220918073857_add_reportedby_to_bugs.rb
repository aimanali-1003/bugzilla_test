# frozen_string_literal: true

class AddReportedbyToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :posted_by
  end
end
