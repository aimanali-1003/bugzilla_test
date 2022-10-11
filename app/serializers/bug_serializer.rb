# frozen_string_literal: true

class BugSerializer < ActiveModel::Serializer

  def project_name
    object.project.name
  end

  def assigned_to_id
    object.assigned_to_id
  end

  attributes :id, :title, :deadline, :status, :project_id, :project_name, :assigned_to_id
end
