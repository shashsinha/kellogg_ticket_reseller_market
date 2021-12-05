class AddEventLocationLatitudeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_location_latitude, :float
  end
end
