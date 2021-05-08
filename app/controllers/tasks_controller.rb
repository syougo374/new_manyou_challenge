class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    # @tasks = Task.all.order(params[:sort_expired])
    if params[:sort_expired]

      @tasks = Task.all.order(endtime_at: :desc)    
    else 
      @tasks = Task.all.order(id: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    # @task = current_user.tasks.build(task_params)
    @task = Task.new(task_params)
    if @task.save
      # @task = current_user.tasks.build(picture_params)
      redirect_to tasks_path, notice: 'タスクを投稿しました'
    else
      render :new
    end
  end

  # def confirm
  #   @task = current_user.tasks.build(task_params)
  #   render :new if @task.invalid?  
  # end
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました"
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました'
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
    params.require(:task).permit(:title,:content,:daytime,:endtime_at,:status)
  end

end
