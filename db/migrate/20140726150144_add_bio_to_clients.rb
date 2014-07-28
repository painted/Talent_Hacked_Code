class AddBioToClients < ActiveRecord::Migration
  def change
    add_column :clients, :companyBio, :text
  end
end
