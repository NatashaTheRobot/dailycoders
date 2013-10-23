class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def new

  end

  def edit

  end

  def update
     if @user.update(user_params)
       redirect_to @user, notice: "Your account was successfully updated"
     else
       render action: 'edit'
     end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "Your account was successfully deleted"
  end

  private

  def set_user
    @user = User.friendly.find(params[:id].to_s.downcase)
  end

  def user_params
    params.require(:user).permit(:name, :location, :bio)
  end
end
