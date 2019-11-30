Benchmark.bm do |bm|
    bm.report("Populating database with killedMonsters") do
        user = User.last
        200.times do
            KilledMonster.create(user_id: user.id, monster_id: monster.id)
        end
    end
end