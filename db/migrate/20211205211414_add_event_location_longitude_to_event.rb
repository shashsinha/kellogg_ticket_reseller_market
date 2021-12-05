class AddEventLocationLongitudeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_location_longitude, :float
  end
end
