class AddMoreColumnsToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :avatarUrl, :string
    add_column :developers, :linkedinPublicUrl, :string
    add_column :developers, :address, :text
    add_column :developers, :dob, :date
    add_column :developers, :twitter, :string
  end
end
