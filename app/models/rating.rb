class Rating < ActiveRecord::Base
    belongs_to :chef
    belongs_to :recipe
end