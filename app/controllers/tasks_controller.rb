class TasksController < ApplicationController

  def index
    @tasks = Task.all
    # @tasks = [
    #   {
    #     name: "read",
    #     description: "read books",
    #     completion_status: "in progress",
    #     completion_date: "TBD"
    #   },
    #   {
    #     name: "cook",
    #     description: "chop and heat food in a delicious manner",
    #     completion_status: "not started",
    #     completion_date: "today, 6pm"
    #   },
    #   {
    #     name: "walk",
    #     description: "take imaginary dog for a walk",
    #     completion_status: "done",
    #     completion_date: "today, 7am"
    #   }
    # ]
  end

  def show
    @task = Task.find(params[:id])
    # @id = params[:id]

    # @new_task = {
    #   name: params[:name],
    #   description: params[:description],
    #   completion_status: params[:completion_status],
    #   completion_date: params[:completion_date],
    # }

    # @new_task = @tasks[0]

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

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed_at, :completed)
  end
end
