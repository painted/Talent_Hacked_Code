class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :deadline
      t.belongs_to :contact, index: true
      t.timestamps
    end
  end
end
