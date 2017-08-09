class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :check_user_rights, only: [:destroy]

  def show
  end

  def index
    @users = User.all
  end

  def update
  end

  def destroy
    @user.destroy
  end

  private

  def check_user_rights
    if current_user.user?
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
