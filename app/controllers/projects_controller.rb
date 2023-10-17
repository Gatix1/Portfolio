class ProjectsController < ApplicationController
    def index
        @projects = Project.all

        render json: @projects, status: :ok
    end

    def show
        @project = Project.find(params[:id])

        render json: @project, status: :ok
    end

    def create
        @project = Project.new(project_params)
        @project.save

        render json: @project, status: :created
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)

        render json: @project, status: :ok
    end

    def destroy
        @project = Project.where(id: params[:id]).first
        if @project.destroy
            head :ok
        else
            head :unprocessable_entity
        end
    end

    private

    def project_params
        params.permit(:title, :stack, :description, :github_link, :image_url)
    end
end
