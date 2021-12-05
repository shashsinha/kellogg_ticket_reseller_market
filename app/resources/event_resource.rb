class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :time_of_event, :datetime
  attribute :created_by_id, :integer
  attribute :event_location, :string
  attribute :description, :string
  attribute :event_category_id, :integer

  # Direct associations

  # Indirect associations

end
