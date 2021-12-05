require "open-uri"
class Event < ApplicationRecord
  before_validation :geocode_event_location

  def geocode_event_location
    if event_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(event_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.event_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.event_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.event_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :event_category,
             counter_cache: true

  has_many   :tickets,
             dependent: :destroy

  belongs_to :created_by,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    time_of_event
  end
end
