class AddTicketBoughtReferenceToBoughtTickets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bought_tickets, :tickets, column: :ticket_bought_id
    add_index :bought_tickets, :ticket_bought_id
    change_column_null :bought_tickets, :ticket_bought_id, false
  end
end
