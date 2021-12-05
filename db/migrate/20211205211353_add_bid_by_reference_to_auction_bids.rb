class AddBidByReferenceToAuctionBids < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :auction_bids, :users, column: :bid_by_id
    add_index :auction_bids, :bid_by_id
    change_column_null :auction_bids, :bid_by_id, false
  end
end
