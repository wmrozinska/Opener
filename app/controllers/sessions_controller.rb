class SessionsController < ApplicationController
  def new
  end

  def create
    users = User.where(user_name: params[:user][:user_name])
    user = users.first

    if user && user.password == params[:user][:password]
      system ("say Let's have some fun!")
      
      # generate random 30-characters string
      length = 30
      user.session_token = rand(36**length).to_s(36)

      session[:current_user_id] = user.id
      cookies[:session_token] = user.session_token

      flash[:notice] = "You have successfully logged in."
      redirect_to root_url
    else
      flash[:notice] = "Wrong username or password."
      redirect_to new_session_path
    end
  end
end
