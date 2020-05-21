class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = User.get_posts(params[:id])
  end

  def edit
  end
 
  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website,
                                :bio, :email, :phone, :gender, :avatar)
  end 
end
