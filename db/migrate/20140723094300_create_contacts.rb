class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :phone
      t.belongs_to :client, index: true
      t.timestamps
    end
  end
end
