class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gameplay_url, flash: { success: "Welcome #{user.name}" }
    else
      flash.now[:error] = "Name or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logout!"
  end

  def game_play
    @user = User.find_by_id(session[:user_id])

    redirect_to login_url, flash: { notice: "Need login to play" } unless @user
  end
end
