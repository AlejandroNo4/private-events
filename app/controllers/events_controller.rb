class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy 

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "event created!"
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to request.referrer || root_url
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

  def correct_user
    @event = current_user.created_events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end
end
