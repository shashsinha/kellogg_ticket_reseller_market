class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @q = Ticket.ransack(params[:q])
    @tickets = @q.result(distinct: true).includes(:sold_by, :bought_tickets,
                                                  :auction_bids, :event).page(params[:page]).per(10)
  end

  def show
    @auction_bid = AuctionBid.new
    @bought_ticket = BoughtTicket.new
  end

  def new
    @ticket = Ticket.new
  end

  def edit; end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      message = "Ticket was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @ticket, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    message = "Ticket was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to tickets_url, notice: message
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:event_id, :sold_by_id, :price,
                                   :end_bid_time, :starting_bid, :target_bid, :description)
  end
end
