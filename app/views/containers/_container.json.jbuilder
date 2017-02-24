json.extract! container, :id, :name, :image, :command, :exposed_port, :host_port, :server_id, :created_at, :updated_at
json.url container_url(container, format: :json)