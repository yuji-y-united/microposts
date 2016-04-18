class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :validate_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def edit
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
