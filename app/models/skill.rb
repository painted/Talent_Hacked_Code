class Skill < ActiveRecord::Base
  has_many :projects, through: :levels
  has_many :developers, through: :levels
  has_many :levels
  validates :name, uniqueness: true
end
