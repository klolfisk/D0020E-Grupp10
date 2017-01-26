class HomeController < ApplicationController
	def index
		@servers = Server.all
		@containers = Container.all
	end
end
