json.extract! auction_bid, :id, :ticket_id, :bid_by_id, :created_at, :updated_at
json.url auction_bid_url(auction_bid, format: :json)
