# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do
  game=Game.create(name: Faker::Superhero.power, artwork_url:Faker::Internet.url)
  any=CategoryLeaderboard.new(title: "Any %", rules: Faker::Lorem.sentence)

  hundred=CategoryLeaderboard.new(title: "100%", rules: Faker::Lorem.sentence)

  game.category_leaderboards<<any
  game.category_leaderboards<<hundred

  any.save
  hundred.save
  game.save
end

10.times do
  run=Run.new(speedrun_id: Faker::Color.hex_color, run_url: Faker::Internet.url)
  CategoryLeaderboard.all.sample.runs<<run
  runner=Runner.create(username:Faker::Team.name, stream_url: Faker::Internet.url, twitch_id: Faker::Number.number(5))
  runner.runs<<run
  run.save
  runner.save
end

CategoryLeaderboard.all.each do |category|
  placements=category.placements.split(",")
  placement_ids=placements.map do |place|
    place=Run.all.sample.speedrun_id
  end
  category.placements=placement_ids.join(",")
  category.save
end
