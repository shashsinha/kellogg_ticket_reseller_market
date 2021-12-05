class AddEventReferenceToTickets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tickets, :events
    add_index :tickets, :event_id
    change_column_null :tickets, :event_id, false
  end
end
