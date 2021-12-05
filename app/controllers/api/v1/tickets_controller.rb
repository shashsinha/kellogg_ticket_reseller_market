class Api::V1::TicketsController < Api::V1::GraphitiController
  def index
    tickets = TicketResource.all(params)
    respond_with(tickets)
  end

  def show
    ticket = TicketResource.find(params)
    respond_with(ticket)
  end

  def create
    ticket = TicketResource.build(params)

    if ticket.save
      render jsonapi: ticket, status: :created
    else
      render jsonapi_errors: ticket
    end
  end

  def update
    ticket = TicketResource.find(params)

    if ticket.update_attributes
      render jsonapi: ticket
    else
      render jsonapi_errors: ticket
    end
  end

  def destroy
    ticket = TicketResource.find(params)

    if ticket.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: ticket
    end
  end
end
