class ProjectsController < ApplicationController

	def new
		@client = Client.find params[:client_id]
		@project = @client.projects.new
	end

	def create
		@client = Client.find params[:client_id]
		params['project'].delete('skills')
		@project = @client.projects.create project_params
		redirect_to client_path(@client.id)
	end

	def show
		@client = Client.find params[:client_id]
		@project = @client.projects.find params[:id]
		if params['project']['skills']
      params['project']['skills'].split(',').map do |skill_name| 
      skill = Skill.find_or_create_by(name: skill_name.strip) 
        @project.skills << skill
    	end
    end
	end
# puts project_params
  #   if project_params[:skills]
		# @client = Client.find params[:client_id]
		# @project = @client.projects.find params[:id]

  #     project_params.delete('skills').split(',').map do |skill_name| 
  #       skill = Skill.find_or_create_by(name: skill_name.strip) 
  #       @project.skills << skill
  #     end
  #   end

	private
	def project_params
		params[:project].permit(:name, :deadline, :client_id, :budget, :projectIndustry,:skills, :description)
	end
end
