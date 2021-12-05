class CreateBoughtTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :bought_tickets do |t|
      t.integer :ticket_bought_id
      t.integer :bought_by_id

      t.timestamps
    end
  end
end
