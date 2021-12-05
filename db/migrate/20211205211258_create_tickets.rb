class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.integer :sold_by_id
      t.integer :price
      t.datetime :end_bid_time
      t.integer :starting_bid
      t.integer :target_bid
      t.text :description

      t.timestamps
    end
  end
end
