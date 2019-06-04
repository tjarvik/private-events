class EventsController < ApplicationController
  require 'date'
  before_action :current_user
  
  def new
    @users = User.where.not("name = ?", @current_user.name)
  end

  def create
    time = DateTime.new(params[:event]["time(1i)"].to_i, 
                    params[:event]["time(2i)"].to_i, 
                    params[:event]["time(3i)"].to_i,
                    params[:event]["time(4i)"].to_i, 
                    params[:event]["time(5i)"].to_i)
    event = @current_user.hosted_events.build(description: params[:event][:description], time: time)
    event.save
    Attendance.create(attendee_id: @current_user.id, attended_event_id: event.id)
    params[:event][:invited].each do |invitee, value|
      if value == "1"
        Attendance.create(attendee_id: invitee, attended_event_id: event.id)
      end
    end
    redirect_to action: 'index'
  end

  def index
    @past_events = Event.past
    @future_events = Event.future
  end

  def show
    event = Event.find(params[:id])
    @events = [event]
    @attendees = event.attendees
  end

end
