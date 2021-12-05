class AuctionBid < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ticket.to_s
  end

end
