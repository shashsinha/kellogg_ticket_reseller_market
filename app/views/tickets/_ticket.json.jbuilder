json.extract! ticket, :id, :event_id, :sold_by_id, :price, :end_bid_time, :starting_bid, :target_bid, :description, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
