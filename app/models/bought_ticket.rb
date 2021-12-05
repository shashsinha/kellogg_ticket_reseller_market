class BoughtTicket < ApplicationRecord
  # Direct associations

  belongs_to :ticket_bought,
             :class_name => "Ticket"

  belongs_to :bought_by,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ticket_bought.to_s
  end

end
