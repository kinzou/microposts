class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
 
  def show 
    render 'show'
  end
 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user   # ここを修正
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated Profile"
      redirect_to user_path(@user)   # ここを修正
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile,
                                 :password_confirmation)
  end
  
  def set_params
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path if @user != current_user
  end
end