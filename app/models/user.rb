class User < ApplicationRecord
    has_secure_password
    has_many :deaths
    has_many :killed_monsters
    has_many :collected_coins
    has_many :trophies

    validates :name, presence: true

    #get categories scored by user
    def scored_categories
        trophies = self.trophies
        trophies.pluck(:level_score_id).map {|id| LevelScore.find_by_id(id).category }.uniq
    end
end
