json.extract! question, :id, :content, :sentence, :status, :created_at, :updated_at
json.url question_url(question, format: :json)
