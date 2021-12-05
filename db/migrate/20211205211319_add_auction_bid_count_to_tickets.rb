class AddAuctionBidCountToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :auction_bids_count, :integer
  end
end
