class TasksController < ApplicationController
  before_action :set_task, only:[:show,:edit,:update]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      # @task = current_user.tasks.build(picture_params)
      redirect_to task_path(@task.id), notice: 'picture page was successfully created.'
    else
      render :new
    end
  end

  def confirm
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?  
  end
  def update
    if @task.update(task_params)
      redirect_to tasks_path ,notice:'イベントを更新しまいた'
    else
      render :edit
    end
  end

  def destroy
  end

  def show

  end

  def edit
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:title,:content)
  end

end
