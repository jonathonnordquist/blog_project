class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:users).permit(:user_name, :name, :email, :password, :password_confirmation)
    end
end
