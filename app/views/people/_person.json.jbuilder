json.extract! person, :id, :name, :account_id, :room_id, :created_at, :updated_at
json.url person_url(person, format: :json)
