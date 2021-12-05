class BoughtTicketsController < ApplicationController
  before_action :set_bought_ticket, only: %i[show edit update destroy]

  def index
    @q = BoughtTicket.ransack(params[:q])
    @bought_tickets = @q.result(distinct: true).includes(:bought_by,
                                                         :ticket_bought).page(params[:page]).per(10)
  end

  def show; end

  def new
    @bought_ticket = BoughtTicket.new
  end

  def edit; end

  def create
    @bought_ticket = BoughtTicket.new(bought_ticket_params)

    if @bought_ticket.save
      message = "BoughtTicket was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @bought_ticket, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @bought_ticket.update(bought_ticket_params)
      redirect_to @bought_ticket,
                  notice: "Bought ticket was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @bought_ticket.destroy
    message = "BoughtTicket was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to bought_tickets_url, notice: message
    end
  end

  private

  def set_bought_ticket
    @bought_ticket = BoughtTicket.find(params[:id])
  end

  def bought_ticket_params
    params.require(:bought_ticket).permit(:ticket_bought_id, :bought_by_id)
  end
end
