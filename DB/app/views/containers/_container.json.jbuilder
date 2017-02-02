json.extract! container, :id, :container_id, :name, :image, :port, :status, :command, :created_at, :updated_at
json.url container_url(container, format: :json)