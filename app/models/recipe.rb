class Recipe < ActiveRecord::Base
    has_many :ingredients
    belongs_to :chef
    has_many :ratings
end