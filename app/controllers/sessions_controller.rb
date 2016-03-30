class SessionsController < ApplicationController
  def new
    if request.xhr?
      render :new, layout: false
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Incorrect Username or password'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
