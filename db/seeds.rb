# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# 10.times do
#   game=Game.create(name: Faker::Superhero.power, artwork_url:Faker::Internet.url)
#   any=CategoryLeaderboard.new(title: "Any %", rules: Faker::Lorem.sentence)
#
#   hundred=CategoryLeaderboard.new(title: "100%", rules: Faker::Lorem.sentence)
#
#   game.category_leaderboards<<any
#   game.category_leaderboards<<hundred
#
#   any.save
#   hundred.save
#   game.save
# end
#
# 10.times do
#   run=Run.new(speedrun_id: Faker::Color.hex_color, run_url: Faker::Internet.url)
#   CategoryLeaderboard.all.sample.runs<<run
#   runner=Runner.create(username:Faker::Team.name, stream_url: Faker::Internet.url, twitch_id: Faker::Number.number(5))
#   runner.runs<<run
#   run.save
#   runner.save
# end
#
# CategoryLeaderboard.all.each do |category|
#   placements=category.placements.split(",")
#   placement_ids=placements.map do |place|
#     place=Run.all.sample.speedrun_id
#   end
#   category.placements=placement_ids.join(",")
#   category.save
# end

mario64=Game.create(name: "Super Mario 64", artwork_url: "http://www.mobygames.com/images/covers/l/216304-super-mario-64-nintendo-64-front-cover.jpg")

oot=Game.create(name: "The Legend of Zelda: Ocarina of Time", artwork_url:"http://cdn.playbuzz.com/cdn/a9a90ae4-de77-4549-a76a-9280d3cd9868/a3a6d061-0541-4112-9817-23dd83836fb7.png")

cheese=Runner.create(username:"cheese05", stream_url:"https://www.twitch.tv/cheese05")

puncay=Runner.create(username:"puncayshun", stream_url:"https://www.twitch.tv/puncayshun")

skater=Runner.create(username:"skater82297", stream_url:"https://www.twitch.tv/skater82297")

torje=Runner.create(username:"torjeagc", stream_url:"https://www.twitch.tv/torjeagc")

mario120star=CategoryLeaderboard.create(placements: "8m73rgwy,1zqjp35m,3,4,5,6,7,8,9,10", game_id:1, title:"120 Star", rules: "Complete the game while collecting every star. No restrictions. All forms of BLJ are allowed.

Timing starts from reset and ends when the big star is collected at the end of the game.")

ootany=CategoryLeaderboard.create(placements: "8m7ow6wy,9yo05q1y,3,4,5,6,7,8,9,10", game_id:2, title: "Any %", rules: "Any% Rules:
-Reach the 'The End' screen, no additional restrictions.
-Timing ends at the start of the Ganon death cutscene, or upon the credits scene loading (if done via wrongwarp).

Ocarina of Time Rules
-Timing starts when selecting 'Yes' on the file select screen
-1.0/1.1 Virtual Console or GameCube injects are banned

Emulator-specific rules:
-You must use Project64 1.6 or 1.7. All other emulators and versions (such as Mupen64 and Project64 2.0+) are banned.
-You must use the default settings for emulation.
-Tricks and glitches exclusive to 1.0/1.1 cannot be used on emulator to save time.")

mario_first=Run.create(speedrun_id:"8m73rgwy", runner_id:1, category_leaderboard_id: 1, run_url:"https://www.youtube.com/watch?v=EfS81QvdbF8")

mario_second=Run.create(speedrun_id:"1zqjp35m", runner_id:2, category_leaderboard_id: 1, run_url:"https://www.youtube.com/watch?v=f_lXYIUf3KE")

zelda_first=Run.create(speedrun_id:"8m7ow6wy", runner_id:3, category_leaderboard_id: 2, run_url:"https://www.youtube.com/watch?v=9BGE9H7iPx8")

zelda_second=Run.create(speedrun_id:"9yo05q1y", runner_id:4, category_leaderboard_id: 2, run_url:"https://www.youtube.com/watch?v=HGa-mhS4YDY")
