module V1

  class CommentsController < ApplicationController
    before_action :set_task
    before_action :set_task_comment, only: [:show, :update, :destroy]

    def index
      json_response(@task.comments)
    end

    def show
      json_response(@comment)
    end

    def create
      @task.comments.create!(comment_params)
      json_response(@comment, :created)
    end

    def destroy
      @comment.destroy
      head :no_content
    end

    private

    def comment_params
      params.permit(:title)
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_task_comment
      @comment = @task.comments.find(params[:id]) if @comment
    end
  end

end
