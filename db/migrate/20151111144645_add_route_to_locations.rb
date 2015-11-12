class AddRouteToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :route, :string
  end
end
