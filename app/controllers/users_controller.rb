class UsersController < ApplicationController

  def new
  end

  def create
    username = params[:user][:name]
    if User.find_by(name: username)
      flash.now[:danger] = "#{username} is already taken"
      render 'new'
    else
      user = User.create(name: username)
      session[:userid] = user.id
      redirect_to action: 'show', id: user.id
    end
  end

  def show
    @user = User.find(params[:id])
    if session[:userid]
      @current_user = User.find(session[:userid].to_i)
      @hosted_events = @user.hosted_events
    else
      redirect_to user_new_path
    end
  end

end
