class AddInviterToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :inviter, :string
  end
end
