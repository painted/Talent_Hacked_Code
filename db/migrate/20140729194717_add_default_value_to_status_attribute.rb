class AddDefaultValueToStatusAttribute < ActiveRecord::Migration
  def change
	change_column :statuses, :status, :string, :default => "pending"
  end
end
