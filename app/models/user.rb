# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, foreign_key: :creator_id, dependent: :destroy
  has_many :bugs, through: :projects
  has_many :enrollments, dependent: :destroy
  has_many :project_enrollment, through: :enrollments, source: :project
  enum role: { Manager: 0, Developer: 1, QA: 2 }

  def name_role
    " #{name} - #{role}"
  end
end
