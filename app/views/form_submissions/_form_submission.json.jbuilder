json.extract! form_submission, :id, :form_id, :user_id, :answer, :completed_on, :created_at, :updated_at
json.url form_submission_url(form_submission, format: :json)
