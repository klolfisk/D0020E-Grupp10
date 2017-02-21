class Server < ApplicationRecord
	has_many :serverhascontainers
	has_many :containers, :through => :serverhascontainers
end
