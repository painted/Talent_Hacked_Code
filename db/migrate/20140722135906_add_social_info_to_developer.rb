class AddSocialInfoToDeveloper < ActiveRecord::Migration
  def change
    add_column :developers, :website, :string
    add_column :developers, :github, :string
    add_column :developers, :facebook, :string
  end
end
