class Category < ApplicationRecord
    self.abstract_class = true
    belongs_to :user
    after_create_commit :process_score
    def process_score        
        puts "Entrei pontuation"
        category_score = self.class.count
        category_name = self.class.name
        puts category_name
        user_id = self.user_id
        level_score = LevelScore.find_by category: category_name, score: category_score

        if level_score
            Trophy.create(user_id: user_id, level_score_id: level_score.id)
        else
            puts "Dont reach pontuation"
        end
     end

end