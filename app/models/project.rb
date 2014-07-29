class Project < ActiveRecord::Base
	belongs_to :client
  has_many :developers, through: :statuses
  has_many :skills, through: :levels
  has_many :languages, through: :proficiencies
  has_many :levels
  has_many :proficiencies
end
