json.extract! user, :id, :Username, :zip, :created_at, :updated_at
json.url user_url(user, format: :json)
