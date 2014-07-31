class AddProjectIdToLevels < ActiveRecord::Migration
  def change
    add_reference :levels, :project, index: true
  end
end
