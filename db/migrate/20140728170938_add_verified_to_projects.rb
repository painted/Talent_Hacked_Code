class AddVerifiedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :verified, :boolean, :default => false, :null => false
  end
end
