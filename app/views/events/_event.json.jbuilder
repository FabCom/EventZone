json.extract! event, :id, :start_date, :duration, :title, :description, :price, :location, :administrator_id, :created_at, :updated_at
json.url event_url(event, format: :json)
