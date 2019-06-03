class EventsController < ApplicationController
  before_action :current_user

  def new
    @users = User.where.not("name = ?", @current_user.name)
  end

  def create
    event = @current_user.hosted_events.build(description: params[:event][:description],
                                      time: params[:event][:time])
                                      
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
    @events = Event.all
  end

  def show
    event = Event.find(params[:id])
    @events = [event]
    @attendees = event.attendees
  end

end
