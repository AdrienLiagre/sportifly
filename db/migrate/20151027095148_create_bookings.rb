class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :activity, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
