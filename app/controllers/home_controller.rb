class HomeController < ApplicationController
	def index
		@servers = Server.all
		@containers = Container.all
		@newContainer = Container.new
	end
end
