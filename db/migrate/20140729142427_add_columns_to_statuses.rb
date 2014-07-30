class AddColumnsToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :developer_id, :integer
    add_column :statuses, :project_id, :integer
    add_column :statuses, :status, :string
  end
end
