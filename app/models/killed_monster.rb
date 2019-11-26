class KilledMonster < Category
  #belongs_to :user
  belongs_to :monster

  def pontuation_process
    puts "Entrei pontuation monster"
    category_point = KilledMonster.where(monster_id: self.monster.id).count
    category_name = self.class.name
    puts category_name
    user_id = self.user_id
    level_point = LevelPoint.find_by category: category_name, quantity: category_point

    if level_point
      reached_pontuation = false
      Monster.all.each do |monster|
        puts "Monster Name: #{monster.name}  Quantity: #{monster.killed_monsters.count}"       
        reached_pontuation = monster.killed_monsters.count == level_point.quantity ? true : false
        puts reached_pontuation
      end
      Trophy.create(user_id: user_id, level_point_id: level_point.id) if reached_pontuation
    else
        puts "Dont reach pontuation"
    end
  end
end
