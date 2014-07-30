class Project < ActiveRecord::Base

	after_create :save_status

	belongs_to :client

  has_many :developers, through: :statuses
  has_many :skills, through: :levels
  has_many :languages, through: :proficiencies
  has_many :levels
  has_many :proficiencies
  has_many :statuses
  accepts_nested_attributes_for :statuses

	def save_status
		# status = Status.create
		# status[:project_id] = self.id
		# status.save
		# @project.statuses.first_or_create(:project_id => @project.id)
		 self.statuses.first_or_create("project_id" => self.id)
	end

	def viable_developers
		Developer.where(verified: true)(.to_a).select do | developer|
	    	skills.all? {| project_skill | developer.skills.include?(project_skill) }
	    end
	end

end
