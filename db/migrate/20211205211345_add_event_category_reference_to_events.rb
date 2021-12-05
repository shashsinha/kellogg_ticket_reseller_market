class AddEventCategoryReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :event_categories
    add_index :events, :event_category_id
    change_column_null :events, :event_category_id, false
  end
end
