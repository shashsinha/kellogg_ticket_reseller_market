class AddEventLocationFormattedAddressToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_location_formatted_address, :string
  end
end
