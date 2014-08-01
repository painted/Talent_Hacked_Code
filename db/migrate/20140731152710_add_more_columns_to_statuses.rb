class AddMoreColumnsToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :timeframe, :integer
    add_column :statuses, :cost, :integer
    add_column :statuses, :workflow, :text
    add_column :statuses, :pitch, :text
  end
end
