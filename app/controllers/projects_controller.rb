class ProjectsController < ApplicationController

	def index
		@client = Client.find params[:client_id]

		if params[:status]
			@project = @client.projects.where(status: params[:status])
		else
			@project = @client.projects
		end
	end

	def new
		@client = Client.find params[:client_id]
		@project = @client.projects.new
	end

	def create
		@client = Client.find params[:client_id]
		skill = params['project'].delete('skills')
		language = params['project'].delete('languages')
		params['project']['status'] = 'Pending'
		@project = @client.projects.create project_params

		added_skills = skill.split(',').map do |skill_name|
			Skill.find_or_create_by(name: skill_name.strip)
		end
		added_languages = language.split(',').map do |language_name|
			Language.find_or_create_by(name: language_name.strip)
		end
		@project.languages << added_languages
		@project.skills << added_skills
		redirect_to dashboard_path
	end

	def show
		@client = Client.find params[:client_id]
		@project = @client.projects.find params[:id]
	end


	private
	def project_params
		params[:project].permit(:name, :deadline, :client_id, :budget, :projectIndustry,:skills, :description, :status)
	end
end
