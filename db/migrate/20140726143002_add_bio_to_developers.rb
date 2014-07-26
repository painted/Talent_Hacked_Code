class AddBioToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :bio, :text
  end
end
