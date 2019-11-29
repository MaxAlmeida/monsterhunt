class Category < ApplicationRecord
    self.abstract_class = true
    belongs_to :user
    after_create_commit :process_score
    def process_score        
        category_score = self.class.where(user_id: self.user_id).count
        category_name = self.class.name
        puts category_name
        user_id = self.user_id
        level_score = LevelScore.find_by category: category_name, score: category_score
        Trophy.create(user_id: user_id, level_score_id: level_score.id) if level_score
    end
end