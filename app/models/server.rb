class Server < ApplicationRecord
	has_many :servertags
	has_many :tags, :through => :servertags
	has_many :serverhascontainers
	has_many :containers, :through => :serverhascontainers
end
