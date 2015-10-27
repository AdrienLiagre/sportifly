class CreateLocationReviews < ActiveRecord::Migration
  def change
    create_table :location_reviews do |t|
      t.integer :note
      t.text :content
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
