class AddDefaultStatusToProjects < ActiveRecord::Migration
  def change
  	change_column_default :projects, :status, 'pending'
  end
end
