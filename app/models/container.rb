class Container < ApplicationRecord
	has_many :containertags
	has_many :tags, :through => :containertags
	has_many :serverhascontainers
	has_many :servers, :through => :serverhascontainers
end
