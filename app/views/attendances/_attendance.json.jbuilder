json.extract! attendance, :id, :stripe_customer_id, :participant_id, :event_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
