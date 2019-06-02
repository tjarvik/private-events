class EventsController < ApplicationController
  before_action :current_user

  def new
  end

  def create
    event = @current_user.hosted_events.build(description: params[:event][:description],
                                      time: params[:event][:time],
                                      location: params[:event][:location])
    event.save
    redirect_to action: 'index'
  end

  def index
    @events = Event.all
  end

  def show
    @events = Event.find(params[:id])
  end
end
