json.extract! room, :id, :name, :account_id, :created_at, :updated_at
json.url room_url(room, format: :json)
