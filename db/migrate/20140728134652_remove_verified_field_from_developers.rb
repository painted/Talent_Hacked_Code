class RemoveVerifiedFieldFromDevelopers < ActiveRecord::Migration
  def change
    remove_column :developers, :verified
  end
end
