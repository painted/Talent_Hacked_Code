class Project < ActiveRecord::Base

	# before_create :save_status

	belongs_to :client
  	has_many :developers, through: :statuses
  	has_many :skills, through: :levels
  	has_many :languages, through: :proficiencies
  	has_many :levels
  	has_many :proficiencies
  	has_many :statuses
    accepts_nested_attributes_for :statuses

	# def save_status
	# 	# status = Status.create
	# 	# status[:project_id] = self.id
	# 	# status.save
	# 	# @project.statuses.first_or_create(:project_id => @project.id)
	# 	 # self.statuses.first_or_create("project_id" => self.id)
	# 	self.status = 'pending'
	# end

	def skill_list
		skills.map(&:name).join(' ')
	end

	def skill_list=(list_of_skills)
		skills.clear
		added_skills = list_of_skills.split(' ').map(&:strip).uniq.each do |skill_name|
			skills << Skill.find_or_create_by(name: skill_name)
		end
	end

	def dev_match_project (dev_array, project_array)
		match_count = 0
		project_count = project_array.count
		dev_array.each do |skill|
			if project_array.include?(skill)
				match_count += 1
			end
		end
		match_count == project_count
	end

	def viable_developers

		array_of_devs = []

		project_array = []

		self.skills.each do |skill|
			project_array << skill.name	
		end
		Developer.where(verified: true).each do |developer|
			dev_array = []
			developer.skills.each do |skill|
				dev_array << skill.name
			end


			if dev_match_project(dev_array, project_array)
				array_of_devs << developer
			end			
		end

		array_of_devs
	end
end
