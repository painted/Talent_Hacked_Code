class AddPhoneToDeveloper < ActiveRecord::Migration
  def change
    add_column :developers, :phone, :string
  end
end
