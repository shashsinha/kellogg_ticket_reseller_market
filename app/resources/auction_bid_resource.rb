class AuctionBidResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :ticket_id, :integer
  attribute :bid_by_id, :integer

  # Direct associations

  belongs_to :ticket

  belongs_to :bid_by,
             resource: UserResource

  # Indirect associations

end
