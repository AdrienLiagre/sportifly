class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :number_of_players
      t.date :date
      t.boolean :open, default: true
      t.float :price

      t.timestamps null: false
    end
  end
end
