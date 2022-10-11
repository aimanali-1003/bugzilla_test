# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer


  def enrolled_users
      object.enrolled_users
  end

  def user_count
    object.enrolled_users.count
  end

  def bug_count
    object.bugs.count
  end

  attributes :id, :name, :description, :created_at, :creator_id, :enrolled_users, :user_count, :bug_count
end
