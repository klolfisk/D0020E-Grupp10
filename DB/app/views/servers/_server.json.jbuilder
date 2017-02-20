json.extract! server, :id, :name, :port, :running, :ip, :created_at, :updated_at
json.url server_url(server, format: :json)