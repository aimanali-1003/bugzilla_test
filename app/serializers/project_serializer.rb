# frozen_string_literal: true

# project-serializer
class ProjectSerializer < ActiveModel::Serializer
  delegate :enrolled_users, to: :object

  def user_count
    object.enrolled_users.count
  end

  def bug_count
    object.bugs.count
  end

  attributes :id, :name, :description, :created_at, :creator_id, :enrolled_users, :user_count, :bug_count
end
