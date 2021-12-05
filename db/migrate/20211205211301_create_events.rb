class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :time_of_event
      t.integer :created_by_id
      t.string :event_location
      t.text :description
      t.integer :event_category_id

      t.timestamps
    end
  end
end
