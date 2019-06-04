class UsersController < ApplicationController
  before_action :current_user, only: :show

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
    @past_hosted_events = @user.hosted_events.past
    @future_hosted_events = @user.hosted_events.future
    @past_attended_events = @user.attended_events.past
    @future_attended_events = @user.attended_events.future
  end

end
