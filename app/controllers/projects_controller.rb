class ProjectsController < ApplicationController

	def new
		@client = Client.find params[:client_id]
		@contact = @client.contacts.find params[:contact_id]
		@project = @contact.projects.new
	end

	def create
		@client = Client.find params[:client_id]
		@contact = @client.contacts.find params[:contact_id]
		@project = @contact.projects.create project_params
		redirect_to "/clients/#{params[:client_id]}"
	end

	private
	def project_params
		params[:project].permit(:name, :deadline)
	end
end
