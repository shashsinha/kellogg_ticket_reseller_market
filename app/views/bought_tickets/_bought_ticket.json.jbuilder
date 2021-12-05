json.extract! bought_ticket, :id, :ticket_bought_id, :bought_by_id,
              :created_at, :updated_at
json.url bought_ticket_url(bought_ticket, format: :json)
