class ProjectsController < ApplicationController

	def index
		@client = Client.find params[:client_id]
		@project = @client.projects.all
		# @client.projects.each do |project|
		# 	@project_pending if project.status == 'Pending'
		# 	@project_in_progress if project.status == 'In Progress'
		# 	@project_completed if project.status == 'Completed'
		# 	@project_declined if project.status == 'Declined'
		# end
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

		added_skills = skill.split(/,\s?/).uniq.map do |skill_name|
			Skill.find_or_create_by(name: skill_name)
		end
		added_languages = language.split(/,\s?/).uniq.map do |language_name|
			Language.find_or_create_by(name: language_name)
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
