class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    @location_hash = Gmaps4rails.build_markers(@events.where.not(:event_location_latitude => nil)) do |event, marker|
      marker.lat event.event_location_latitude
      marker.lng event.event_location_longitude
      marker.infowindow "<h5><a href='/events/#{event.id}'>#{event.time_of_event}</a></h5><small>#{event.event_location_formatted_address}</small>"
    end
  end

  # GET /events/1
  def show
    @ticket = Ticket.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      message = 'Event was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @event, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    message = "Event was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to events_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:time_of_event, :created_by_id, :event_location, :description, :event_category_id)
    end
end
