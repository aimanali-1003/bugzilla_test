# frozen_string_literal: true

class BugsController < ApplicationController
  before_action :set_bug_project
  before_action :set_bug, only: %i[show status edit update pick_drop]
  before_action :authorize_bug, except: %i[index pick_drop status]

  def index
    @bugs = @project.bugs
  end

  def new
    @bug = @project.bugs.new
  end

  def create
    @bug = @project.bugs.new(set_params)
    @bug.posted_by = current_user
    if @bug.save
      redirect_to [@project, @bug]
      flash[:notice] = I18n.t 'create'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @bug.update(set_params)
      redirect_to [@project, @bug]
      flash[:notice] = I18n.t 'update'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def pick_drop
    if @bug && !@bug.assigned_to_id?
      @bug.assigned_to = current_user
    elsif @bug && @bug.assigned_to == current_user
      @bug.assigned_to = nil
    end
    @bug.save
    redirect_to [@project, @bug]
  end

  def status
    if @project && @bug
      @bug.status = params[:status].to_i
      @bug.save
    end
    redirect_to [@project, @bug]
  end

  private

  def set_bug
    @bug = @project.bugs.find(params[:id])
  end

  def set_bug_project
    @project = Project.find(params[:project_id])
  end

  def authorize_bug
    if @bug.present?
      authorize @bug
    else
      authorize Bug
    end
  end

  def set_params
    params[:bug][:bugtype] = params[:bug][:bugtype].to_i
    params.require(:bug).permit(:title, :description, :deadline, :bugtype, :status, images: [])
  end
end
