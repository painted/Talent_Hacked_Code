class AddVerifiedToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :verified, :boolean, :default => false, :null => false
  end
end
