class ProjectsController < ApplicationController

	def new
		@client = Client.find params[:client_id]
		@project = @client.projects.new
	end

	def create
		@client = Client.find params[:client_id]
		skill = params['project'].delete('skills')
		@project = @client.projects.create project_params

		added_skills = skill.split(',').map do |skill_name|
			Skill.find_or_create_by(name: skill_name.strip)
		end
		@project.skills << added_skills
		redirect_to client_path(@client.id)
	end

	def show
		@client = Client.find params[:client_id]
		@project = @client.projects.find params[:id]
	end


	private
	def project_params
		params[:project].permit(:name, :deadline, :client_id, :budget, :projectIndustry,:skills, :description)
	end
end
