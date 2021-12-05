class AddTicketReferenceToAuctionBids < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :auction_bids, :tickets
    add_index :auction_bids, :ticket_id
    change_column_null :auction_bids, :ticket_id, false
  end
end
