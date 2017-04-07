json.extract! comment, :id, :board_id, :name, :sentence, :published, :created_at, :updated_at
json.url comment_url(comment, format: :json)
