class HomeController < ApplicationController
	#before_action :authenticate_user! # Forces the user to be logged in to see the page. Should maybe consider to create a real index page for unregistered visitors
	def index
		@servers = Server.all
		@containers = Container.all
		@newContainer = Container.new
		@user = current_user
	end
end
