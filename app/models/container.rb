class Container < ApplicationRecord
	attr_accessor :server_name
	has_many :servercontainers
	has_many :servers, :through => :servercontainers
end
