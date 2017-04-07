json.extract! board, :id, :name, :title, :published, :created_at, :updated_at
json.url board_url(board, format: :json)
