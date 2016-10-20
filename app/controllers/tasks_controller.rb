class TasksController < ApplicationController

  before_action :require_login, only: [:index, :show]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # SAVED SUCCESSFULLY
    else
      # DID NOT SAVE
      render :new
    end

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      # SUCCESS
      if @task.completed_at == nil
        @task.completed = false
        @task.save
      end
      redirect_to task_path
    else
      # NOPE
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.completed = true
    @task.completed_at = DateTime.now.to_date
    @task.save
    redirect_to task_path
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed_at, :completed)
  end
end
