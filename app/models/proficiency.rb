class Proficiency < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer
  belongs_to :language
end
