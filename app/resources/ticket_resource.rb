class TicketResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :sold_by_id, :integer
  attribute :price, :integer
  attribute :end_bid_time, :datetime
  attribute :starting_bid, :integer
  attribute :target_bid, :integer
  attribute :description, :string

  # Direct associations

  belongs_to :event

  has_many   :auction_bids

  has_many   :bought_tickets,
             foreign_key: :ticket_bought_id

  belongs_to :sold_by,
             resource: UserResource

  # Indirect associations
end
