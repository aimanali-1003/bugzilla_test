# frozen_string_literal: true

# This shiny device polishes bared foos
class Project < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :bugs, dependent: :destroy
  has_many :enrollments, dependent: :delete_all
  has_many :enrolled_users, through: :enrollments, source: :user

  validates :name, presence: true
end
