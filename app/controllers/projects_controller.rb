# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_project, except: %i[index]
  before_action :add, only: %i[edit]
  before_action :remove, only: %i[edit]
  before_action :find_devs_qas, only: %i[new]

  def index
    @projects = if current_user.Manager?
                  current_user.projects.all
                else
                  current_user.project_enrollment
                end
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.creator = current_user

    user_array(params)
    if @project.save
      redirect_to @project
      flash[:notice] = I18n.t 'create'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    user_array(params)
    if @project.update(project_params)
      redirect_to @project
      flash[:notice] = I18n.t 'update'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
    flash[:notice] = I18n.t 'destroy'
  end

  def delete
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    @project.enrolled_users.delete(@user)
    redirect_to edit_project_path(@project)
  end

  private

  def user_array(params)
    if params[:project][:object_id].any?
      user = params[:project][:object_id].reject!(&:empty?)
      @project.enrolled_users.push(User.find(user))
    end
  end

  def authorize_project
    if @project.present?
      authorize @project
    else
      authorize Project
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def add
    @devs = User.where.not(id: @project.enrolled_users.collect(&:id)).where(role: 'Developer')
    @qas = User.where.not(id: @project.enrolled_users.collect(&:id)).where(role: 'QA')
  end

  def remove
    @user_in_project = @project.enrolled_users
  end

  def find_devs_qas
    @devs = User.where(role: 'Developer')
    @qas = User.where(role: 'QA')
  end
end
