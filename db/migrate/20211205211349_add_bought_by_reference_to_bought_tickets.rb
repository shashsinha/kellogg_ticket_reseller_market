class AddBoughtByReferenceToBoughtTickets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bought_tickets, :users, column: :bought_by_id
    add_index :bought_tickets, :bought_by_id
    change_column_null :bought_tickets, :bought_by_id, false
  end
end
