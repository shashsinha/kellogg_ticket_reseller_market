class AddSoldByReferenceToTickets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tickets, :users, column: :sold_by_id
    add_index :tickets, :sold_by_id
    change_column_null :tickets, :sold_by_id, false
  end
end
