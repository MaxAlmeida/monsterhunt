class KilledMonster < Category
  #belongs_to :user
  belongs_to :monster

  def process_score
      reached_pontuation = false
      category_name = self.class.name
      monster_score = KilledMonster.where(monster_id: self.monster_id, user_id: self.user_id).count
      level_score = LevelScore.find_by category: category_name, score: monster_score
      if level_score
        Monster.all.each do |monster|
          killed_monsters_each_monster = KilledMonster.where(monster_id: monster.id, user_id: self.user.id)
          score_by_monster = killed_monsters_each_monster.count
          reached_pontuation = score_by_monster == level_score.score ? true : false
        end
        Trophy.create(user_id: user_id, level_score_id: level_score.id) if reached_pontuation
      end
    end
end
