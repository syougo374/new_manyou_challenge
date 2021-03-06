class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    if logged_in?
      redirect_to user_path(current_user.id)
    else
    @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  # def show 
  #   if @user.id != current_user.id
  #     redirect_to tasks_path
  #   end
  # end
  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     flash[:success] = "プロフィールを更新しました"
  #     redirect_to user_path(@user.id)
  #   else
  #     render :edit
  #   end
  # end

  def show
    @user = User.find(params[:id])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

#   def user_admin
#     @users = User.all
#     if  current_user.admin == false
#         redirect_to root_path
#     else
#         render action: "index"
#     end
#  end

  def user_params
    params.require(:user).permit(:admin,:name, :email, :password, :password_confirmation)
  end
end