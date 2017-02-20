class Server < ApplicationRecord
	has_many :servercontainers
	has_many :servers, :through => :servercontainers
end
