# frozen_string_literal: true

# This shiny device polishes bared foos
class Enrollment < ApplicationRecord
  self.table_name = 'projects_users'

  belongs_to :project
  belongs_to :user
end
