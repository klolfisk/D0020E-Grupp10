class Container < ApplicationRecord
	attr_accessor :server_name
	has_many :serverhascontainers
	has_many :servers, :through => :serverhascontainers
end
