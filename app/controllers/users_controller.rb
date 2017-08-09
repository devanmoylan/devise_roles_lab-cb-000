class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :check_if_admin, only: [:destroy]

  def show
  end

  def index
    @users = User.all
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def check_if_admin
    redirect_to root_path if current_user.user? || current_user.vip?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
