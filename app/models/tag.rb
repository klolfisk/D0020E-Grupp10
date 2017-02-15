class Tag < ApplicationRecord
	has_many :containertags
	has_many :containers, :through => :containertags
	has_many :servertags
	has_many :servers, :through => :servertags
end
