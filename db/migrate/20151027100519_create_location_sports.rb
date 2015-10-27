class CreateLocationSports < ActiveRecord::Migration
  def change
    create_table :location_sports do |t|
      t.references :location, index: true, foreign_key: true
      t.references :sport, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
