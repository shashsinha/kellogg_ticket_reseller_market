class Event < ApplicationRecord
  # Direct associations

  has_many   :tickets,
             :dependent => :destroy

  belongs_to :created_by,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    time_of_event
  end

end
