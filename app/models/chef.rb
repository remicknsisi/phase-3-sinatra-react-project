class Chef < ActiveRecord::Base
    has_many :recipes
    has_many :reviews, through: :recipes
    # rid of the had many thru since it isnt a join table relationship?
end