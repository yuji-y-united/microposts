class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :validate_user, only: [:edit, :update]

  def new
    @user = User.new
  end
  
  def show
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def edit
  end
  
  def followings
    @fuser = @user.following_users.page(params[:page]).per(10)
  end
  
  def followers
    @fuser = @user.follower_users.page(params[:page]).per(10)
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'update your profile'
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profmessage, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def validate_user
    if current_user != @user
      redirect_to @user
    end
  end
end
