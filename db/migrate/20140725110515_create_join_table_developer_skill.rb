class CreateJoinTableDeveloperSkill < ActiveRecord::Migration
  def change
    create_join_table :developers, :skills do |t|
      # t.index [:developer_id, :skill_id]
      # t.index [:skill_id, :developer_id]
    end
  end
end
