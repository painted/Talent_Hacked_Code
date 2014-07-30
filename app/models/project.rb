class Project < ActiveRecord::Base
	belongs_to :client
  has_many :developers, through: :statuses
  has_many :skills, through: :levels
  has_many :languages, through: :proficiencies
  has_many :levels
  has_many :proficiencies
  has_many :statuses

	def viable_developers
		Developer.where(verified: true)(.to_a).select do | developer|
	    	skills.all? {| project_skill | developer.skills.include?(project_skill) }
	    end
	end
end
