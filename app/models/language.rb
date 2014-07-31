class Language < ActiveRecord::Base
  has_many :projects, through: :proficiencies
  has_many :developers, through: :proficiencies
  has_many :proficiencies
end
