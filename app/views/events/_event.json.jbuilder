json.extract! event, :id, :time_of_event, :created_by_id, :event_location, :description, :event_category_id, :created_at, :updated_at
json.url event_url(event, format: :json)
