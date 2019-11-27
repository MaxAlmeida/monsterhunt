class KilledMonster < Category
  #belongs_to :user
  belongs_to :monster

  def process_score
    puts "Entrei pontuation monster"
    category_score = KilledMonster.where(monster_id: self.monster.id).count
    category_name = self.class.name
    puts category_name
    user_id = self.user_id
    level_score = LevelScore.find_by category: category_name, score: category_score

    if level_score
      puts "entrei if"
      reached_pontuation = false
      Monster.all.each do |monster|
        puts "Monster Name: #{monster.name}  score: #{monster.killed_monsters.count}"       
        reached_pontuation = monster.killed_monsters.count == level_score.score ? true : false
        puts reached_pontuation
      end
      Trophy.create(user_id: user_id, level_score_id: level_score.id) if reached_pontuation
    else
        puts "Dont reach pontuation"
    end
  end
end
