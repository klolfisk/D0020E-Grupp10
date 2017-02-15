json.extract! container, :id, :containerid, :name, :image, :command, :exposedport, :hostport, :status, :created_at, :updated_at
json.url container_url(container, format: :json)