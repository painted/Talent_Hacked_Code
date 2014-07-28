class Level < ActiveRecord::Base
  belongs_to :skill
  belongs_to :developer
end
