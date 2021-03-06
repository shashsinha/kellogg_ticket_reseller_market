class BoughtTicketResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :ticket_bought_id, :integer
  attribute :bought_by_id, :integer

  # Direct associations

  belongs_to :ticket_bought,
             resource: TicketResource

  belongs_to :bought_by,
             resource: UserResource

  # Indirect associations
end
