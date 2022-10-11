# frozen_string_literal: true

module Api::V1
  class BugsController < ApplicationController
    before_action :set_bug_project

    def index
      @p_bugs = @project.bugs
      render json: @p_bugs
    end

    private

    def set_bug
      @bug = @project.bugs.find(params[:id])
    end

    def set_bug_project
      @project = Project.find(params[:project_id])
    end

    def set_params
      params.require(:bug).permit(:title, :description, :deadline, :bugtype, :status, :assigned_to_id, images: [])
    end
  end
end
