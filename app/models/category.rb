class Category < ApplicationRecord
    self.abstract_class = true
    belongs_to :user
    after_create_commit :pontuation_process

    def pontuation_process
        puts "Entrei pontuation"
        category_point = self.class.count
        category_name = self.class.name
        puts category_name
        user_id = self.user_id
        level_point = LevelPoint.find_by category: category_name, quantity: category_point

        if level_point
            Trophy.create(user_id: user_id, level_point_id: level_point.id)
        else
            puts "Dont reach pontuation"
        end
     end

end