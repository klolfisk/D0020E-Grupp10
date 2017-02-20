json.extract! server, :id, :name, :ip, :port, :running, :created_at, :updated_at
json.url server_url(server, format: :json)