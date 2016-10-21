class TasksController < ApplicationController

  before_action :require_login, only: [:index, :show]
  before_action :find_task, only: [:show, :edit, :update, :complete]

  def index
    # @tasks = Task.all
    @tasks = Task.where(users_id: session[:user_id])
  end

  def show; end

  def new
    if session[:user_id].nil?
      flash[:error] = "You must be logged in to create a task"
      redirect_to "/auth/github"
    else
      @task = Task.new
    end
  end

  def create
    @task = Task.new(task_params)
    @task.users_id = session[:user_id]
    if @task.save
      # SAVED SUCCESSFULLY
    else
      # DID NOT SAVE
      render :new
    end

    redirect_to tasks_path
  end

  def edit; end

  def update
    # @task = Task.find(params[:id])
    if @task.update(task_params)
      if @task.completed_at == nil
        @task.completed = false
        @task.save
      end
      redirect_to task_path
    else
      render :edit
    end
  end

  def complete
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

  def find_task
    if Task.find(params[:id]).users_id == session[:user_id]
      @task = Task.find(params[:id])
    else
      flash[:error] = "The task selected is only available to its user"
      redirect_to tasks_path
    end
  end

  def task_params
    params.require(:task).permit(:name, :description, :completed_at, :completed)
  end
end
