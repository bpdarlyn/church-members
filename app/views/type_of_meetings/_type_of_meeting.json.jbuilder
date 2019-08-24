json.extract! type_of_meeting, :id, :name, :description, :code, :created_at, :updated_at
json.url type_of_meeting_url(type_of_meeting, format: :json)
