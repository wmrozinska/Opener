class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new
    user.user_name = params[:user][:user_name]
    user.password = params[:user][:password]
    user.email = params[:user][:email]
    user.save

    system('say welcome on board')
  end
  
  def show
  end
end
