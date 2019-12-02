class Category < ApplicationRecord
    self.abstract_class = true
    belongs_to :user

    after_create_commit :process_score

    def process_score        
        category_score = self.class.where(user_id: self.user_id).size
        category_name = self.class.name
        user_id = self.user_id
        #level_score = LevelScore.where(category: category_name, score: category_score)[0]
        level_score = LevelScore.available_level_scores(category_name, category_score)
        Trophy.create(user_id: user_id, level_score_id: level_score['id']) if level_score
        #Trophy.create(user_id: user_id, level_score_id: level_score.id) if level_score
    end
end