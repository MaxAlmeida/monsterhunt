class KilledMonster < Category
  #belongs_to :user
  belongs_to :monster

  def process_score
      puts "Entre killedmonster"
      category_name = self.class.name
      monster_score = KilledMonster.where(monster_id: self.monster_id, user_id: self.user_id).size
      level_score = LevelScore.find_by category: category_name, score: monster_score
      puts "Monster #{self.monster.name} score: #{monster_score}"
      
      #reach some level score?
      if level_score
        unless others_reached_score(level_score).include? false
          Trophy.create(user_id: user_id, level_score_id: level_score.id) 
          flash.now[:success] = "Name or password is invalid"
        end
      end
  end

  #verify if level score was reached in others monsters categories 
  def others_reached_score(level_score)
    check_reached_score = Array.new
    Monster.where.not(id: self.monster_id).each do |monster|
      killed_monsters_each_monster = KilledMonster.where(monster_id: monster.id, user_id: self.user.id)
      score_by_monster = killed_monsters_each_monster.size
      puts "monster name: #{monster.name} score: #{score_by_monster}" 
      check_reached_score << (score_by_monster >= level_score.score ? true : false)
      puts "Pontuação : #{check_reached_score}"
    end
    check_reached_score
  end

end

