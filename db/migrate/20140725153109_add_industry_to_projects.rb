class AddIndustryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :projectIndustry, :string
  end
end
