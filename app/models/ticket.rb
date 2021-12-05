class Ticket < ApplicationRecord
  # Direct associations

  belongs_to :event

  has_many   :auction_bids,
             :dependent => :destroy

  has_many   :bought_tickets,
             :foreign_key => "ticket_bought_id",
             :dependent => :destroy

  belongs_to :sold_by,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end

end
