class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.belongs_to :project, index: true
      t.belongs_to :developer, index: true
      t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
