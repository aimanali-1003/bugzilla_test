# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def new?
    user.Manager?
  end

  def show?
    return true if @user == @record.creator || @user.project_enrollment.include?(@record)

    false
  end

  def create?
    user.Manager?
  end

  def update?
    return true if @user == @record.creator && @user.Manager?

    false
  end

  def edit?
    return true if @user == @record.creator && @user.Manager?

    false
  end

  def destroy?
    return true if @user == @record.creator && @user.Manager?

    false
  end

  def delete?
    return true if @user.Manager?

    false
  end

  def can_create_bug?
    return true if @user.role == 'QA' && @user.project_enrollment.include?(@record)

    false
  end
end
