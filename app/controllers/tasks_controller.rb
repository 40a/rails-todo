class TasksController < ApplicationController
  def index
    @tasks = Task.plan + Task.done
    @new_task = Task.new
  end

  def create
    Task.create!(create_params)
    redirect_to action: 'index'
  end

  private
  def create_params
    params.require(:task).permit(:name, :description)
  end
end
