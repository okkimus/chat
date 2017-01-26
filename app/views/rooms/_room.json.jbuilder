json.extract! room, :id, :name, :password, :privacy, :created_at, :updated_at
json.url room_url(room, format: :json)