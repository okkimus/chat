json.array!(@messages) do |message|
  json.extract! message, :id, :text
  json.extract! message.user, :name
end