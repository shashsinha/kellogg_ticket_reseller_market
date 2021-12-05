class Ticket < ApplicationRecord
  # Direct associations

  belongs_to :sold_by,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end

end
