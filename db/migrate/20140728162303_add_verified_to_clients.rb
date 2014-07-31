class AddVerifiedToClients < ActiveRecord::Migration
  def change
    add_column :clients, :verified, :boolean, :default => false, :null => false
  end
end
