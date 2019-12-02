# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

level_coin_point = LevelScore.create([
    {level:1, category: 'CollectedCoin', score: 1},
    {level:2, category: 'CollectedCoin', score: 100},
    {level:3, category: 'CollectedCoin', score: 1000},
    {level:4, category: 'CollectedCoin', score: 10000},
    {level:5, category: 'CollectedCoin', score: 100000},
])

level_death_point = LevelScore.create([
    {level:1, category: 'Death', score: 1},
    {level:2, category: 'Death', score: 10},
    {level:3, category: 'Death', score: 25},
    {level:4, category: 'Death', score: 50},
    {level:5, category: 'Death', score: 100},
])

level_killed_monster_point = LevelScore.create([
    {level:1, category: 'killedMonster', score: 1},
    {level:2, category: 'killedMonster', score: 100},
    {level:3, category: 'killedMonster', score: 1000},
    {level:4, category: 'killedMonster', score: 10000},
    {level:5, category: 'killedMonster', score: 100000},
])

monsters = Monster.create([
    {name: "Turtle"},
    {name: "Bowser"},
])