module V1

  class TasksController < ApplicationController
    before_action :set_project
    before_action :set_project_task, only: [:show, :update, :destroy]

    def index
      json_response(@project.items)
    end

    def show
      json_response(@task)
    end

    def create
      @project.tasks.create!(task_params)
      json_response(@project, :created)
    end

    def update
      @task.update(task_params)
      head :no_content
    end

    def destroy
      @task.destroy
      head :no_content
    end

    private

    def task_params
      params.permit(:name, :complete, :deadline)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_project_task
      @task = @project.tasks.find(params[:id]) if @project
    end
  end

end
