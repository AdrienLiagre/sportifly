class FavoriteSport < ActiveRecord::Base
  belongs_to :sport
  belongs_to :user
end
