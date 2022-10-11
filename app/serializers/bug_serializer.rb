# frozen_string_literal: true

# bug-serializer
class BugSerializer < ActiveModel::Serializer
  def project_name
    object.project.name
  end

  delegate :assigned_to_id, to: :object

  attributes :id, :title, :deadline, :status, :project_id, :project_name, :assigned_to_id
end
