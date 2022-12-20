# frozen_string_literal: true

module Api
  module V1
    # class project
    class ProjectsController < ApplicationController
      before_action :set_project, only: %i[show]
      def index
        @projects = Project.all
        render json: @projects
      end

      def show
        render json: @project
      end

      private

      def set_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:name, :description, enrolled_user_ids: [])
      end
    end
  end
end
