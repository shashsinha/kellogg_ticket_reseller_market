class CreateAuctionBids < ActiveRecord::Migration[6.0]
  def change
    create_table :auction_bids do |t|
      t.integer :ticket_id
      t.integer :bid_by_id

      t.timestamps
    end
  end
end
