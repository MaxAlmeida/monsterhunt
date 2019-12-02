class LevelScore < ApplicationRecord
    has_many :trophy
    @@available_level_scores = self.all.to_a.map(&:serializable_hash)
    
    def self.available_level_scores(category, score)
        @@available_level_scores.select do |levelscore| 
            levelscore['category'] == category && levelscore['score'] == score 
        end[0]
    end
end
