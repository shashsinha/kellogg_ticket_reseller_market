class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:created_by, :tickets,
                                                 :event_category).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@events.where.not(event_location_latitude: nil)) do |event, marker|
      marker.lat event.event_location_latitude
      marker.lng event.event_location_longitude
    end
  end

  def show
    @ticket = Ticket.new
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      message = "Event was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @event, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    message = "Event was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to events_url, notice: message
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:time_of_event, :created_by_id,
                                  :event_location, :description, :event_category_id)
  end
end
