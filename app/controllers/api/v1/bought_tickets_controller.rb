class Api::V1::BoughtTicketsController < Api::V1::GraphitiController
  def index
    bought_tickets = BoughtTicketResource.all(params)
    respond_with(bought_tickets)
  end

  def show
    bought_ticket = BoughtTicketResource.find(params)
    respond_with(bought_ticket)
  end

  def create
    bought_ticket = BoughtTicketResource.build(params)

    if bought_ticket.save
      render jsonapi: bought_ticket, status: 201
    else
      render jsonapi_errors: bought_ticket
    end
  end

  def update
    bought_ticket = BoughtTicketResource.find(params)

    if bought_ticket.update_attributes
      render jsonapi: bought_ticket
    else
      render jsonapi_errors: bought_ticket
    end
  end

  def destroy
    bought_ticket = BoughtTicketResource.find(params)

    if bought_ticket.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: bought_ticket
    end
  end
end
