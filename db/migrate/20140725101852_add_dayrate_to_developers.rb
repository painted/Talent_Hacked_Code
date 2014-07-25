class AddDayrateToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :dayrate, :integer
  end
end
