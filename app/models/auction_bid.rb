class AuctionBid < ApplicationRecord
  # Direct associations

  belongs_to :ticket,
             counter_cache: true

  belongs_to :bid_by,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ticket.to_s
  end
end
