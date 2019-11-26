class User < ApplicationRecord
    has_many :deaths
    has_many :killed_monsters
    has_many :collected_coins
    has_many :trophies
end
