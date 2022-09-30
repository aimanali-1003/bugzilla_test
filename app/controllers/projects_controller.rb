# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_project, except: %i[index]

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

    if @project.save
      redirect_to projects_path
      flash[:notice] = I18n.t 'create'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
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

  private

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
    params.require(:project).permit(:name, :description, enrolled_user_ids: [])
  end
end
