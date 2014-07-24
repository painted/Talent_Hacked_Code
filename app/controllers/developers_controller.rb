class DevelopersController < ApplicationController

	def index 
	end

	def show
		@developer = Developer.find params[:id] 
	end

	
end
