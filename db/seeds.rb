# require "csv"

# Game.delete_all
# Platform.delete_all

# filename = Rails.root.join("db/vg.csv")

# puts "Loading Games from CSV file: #{filename}"

# csv_data = File.read(filename)
# games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# games.each do |g|
#  platform = Platform.find_or_create_by(name: g["platform"])

#  if platform && platform.valid?
#   game = platform.games.create(
#     name: g['name'],
#     release_date: g['release_date'],
#     description: g['description'],
#     genre: g['genre'],
#     price: g['price'],
#     developer: g['developer'],
#     cover_art: g['cover_art']
#   )

#   unless game&.valid?
#     puts "invalid game #{g['name']}"
#     next
#   end

#  else
#   puts "Invalid platform #{g['developer']} for game #{g['name']}"
#  end
# end

# puts "Created #{Platform.count} developers"
# puts "Created #{Game.count} games"
