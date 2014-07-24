class AddExtraColumnsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :contact, :string
    add_column :clients, :mobile, :string
    add_column :clients, :role, :string
    add_column :clients, :dob, :date
  end
end
