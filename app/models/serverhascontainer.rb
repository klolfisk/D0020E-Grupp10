class Serverhascontainer < ApplicationRecord
	belongs_to :container
	belongs_to :server
end
