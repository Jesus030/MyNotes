json.extract! note, :id, :title, :topic, :reference, :picture, :description, :created_at, :updated_at
json.url note_url(note, format: :json)
