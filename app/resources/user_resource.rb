class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email_address, :string
  attribute :credit_card_number, :integer
  attribute :credit_card_zip_code, :integer
  attribute :credit_card_expiration, :date
  attribute :email, :string

  # Direct associations

  has_many   :auction_bids,
             foreign_key: :bid_by_id

  has_many   :bought_tickets,
             foreign_key: :bought_by_id

  has_many   :events,
             foreign_key: :created_by_id

  has_many   :tickets,
             foreign_key: :sold_by_id

  # Indirect associations
end
