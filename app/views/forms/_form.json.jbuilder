json.extract! form, :id, :name, :description, :status, :required_by, :created_at, :updated_at
json.url form_url(form, format: :json)
