class AddEventCountToEventCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :event_categories, :events_count, :integer
  end
end
