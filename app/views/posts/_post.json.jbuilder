json.extract! post, :id, :title, :body, :schedule, :isImportant, :created_at, :updated_at
json.url post_url(post, format: :json)
