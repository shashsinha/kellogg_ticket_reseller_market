class AddCreatedByReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :users, column: :created_by_id
    add_index :events, :created_by_id
    change_column_null :events, :created_by_id, false
  end
end
