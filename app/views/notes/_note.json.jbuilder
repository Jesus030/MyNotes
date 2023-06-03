json.extract! note, :id, :title, :topic, :reference, :image, :description, :created_at, :updated_at
json.url note_url(note, format: :json)
