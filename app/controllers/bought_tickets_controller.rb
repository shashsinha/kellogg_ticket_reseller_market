class BoughtTicketsController < ApplicationController
  before_action :set_bought_ticket, only: [:show, :edit, :update, :destroy]

  # GET /bought_tickets
  def index
    @bought_tickets = BoughtTicket.page(params[:page]).per(10)
  end

  # GET /bought_tickets/1
  def show
  end

  # GET /bought_tickets/new
  def new
    @bought_ticket = BoughtTicket.new
  end

  # GET /bought_tickets/1/edit
  def edit
  end

  # POST /bought_tickets
  def create
    @bought_ticket = BoughtTicket.new(bought_ticket_params)

    if @bought_ticket.save
      message = 'BoughtTicket was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @bought_ticket, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /bought_tickets/1
  def update
    if @bought_ticket.update(bought_ticket_params)
      redirect_to @bought_ticket, notice: 'Bought ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bought_tickets/1
  def destroy
    @bought_ticket.destroy
    message = "BoughtTicket was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to bought_tickets_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bought_ticket
      @bought_ticket = BoughtTicket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bought_ticket_params
      params.require(:bought_ticket).permit(:ticket_bought_id, :bought_by_id)
    end
end
