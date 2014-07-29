class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :developer, index: true

      t.timestamps
    end
  end
end
