class ProjectsController < ApplicationController

	def new
		@client = Client.find params[:client_id]
		@project = @client.projects.new
	end

	def create
		@client = Client.find params[:client_id]
		@project = @client.projects.create project_params
		redirect_to client_path(@client.id)
	end

	private
	def project_params
		params[:project].permit(:name, :deadline, :client_id, :budget, :projectIndustry, :description)
	end
end
