class BoughtTicket < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ticket_bought.to_s
  end

end
