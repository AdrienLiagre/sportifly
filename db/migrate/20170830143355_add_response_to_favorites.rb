class AddResponseToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :response, :integer
  end
end
