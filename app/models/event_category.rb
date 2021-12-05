class EventCategory < ApplicationRecord
  # Direct associations

  has_many   :events,
             dependent: :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
