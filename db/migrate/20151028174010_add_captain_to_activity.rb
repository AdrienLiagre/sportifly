class AddCaptainToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :captain_id, :integer
    add_index :activities, :captain_id
  end
end
