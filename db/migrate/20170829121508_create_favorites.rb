class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :sport_id

      t.timestamps null: false
    end
  end
end
