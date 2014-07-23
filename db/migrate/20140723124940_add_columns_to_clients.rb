class AddColumnsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :address, :text
    add_column :clients, :github, :string
    add_column :clients, :twitter, :string
    add_column :clients, :facebook, :string
    add_column :clients, :linkedinPublicUrl, :string
    add_column :clients, :avatarUrl, :string
  end
end
