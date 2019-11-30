class KilledMonster < Category
  #belongs_to :user
  belongs_to :monster

  def process_score
      puts "Entre killedmonster"
      category_name = self.class.name
      monster_score = KilledMonster.where(monster_id: self.monster_id, user_id: self.user_id).size
      puts "Monster #{self.monster.name} score: #{monster_score}"
      level_score = LevelScore.find_by category: category_name, score: monster_score
      reached_score = true if level_score
      if reached_score
        reached_others_monsters = Array.new
        Monster.where.not(id: self.monster_id).each do |monster|
          killed_monsters_each_monster = KilledMonster.where(monster_id: monster.id, user_id: self.user.id)
          score_by_monster = killed_monsters_each_monster.size
          puts "monster name: #{monster.name} score: #{score_by_monster}" 
          reached_others_monsters << (score_by_monster >= level_score.score ? true : false)
          puts "Ponntuação : #{reached_others_monsters}"
        end
        unless reached_others_monsters.include? false
          Trophy.create(user_id: user_id, level_score_id: level_score.id) 
        end
      end
    end
    
end

