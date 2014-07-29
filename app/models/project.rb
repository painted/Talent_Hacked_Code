class Project < ActiveRecord::Base
	belongs_to :client
  has_many :skills, through: :levels
  has_many :levels
end
