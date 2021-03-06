require "csv"

GameGenre.delete_all
Genre.delete_all
OrderedGame.delete_all
Order.delete_all
Game.delete_all
Platform.delete_all
Page.delete_all
# AdminUser.delete_all

filename = Rails.root.join("db/vg.csv")

puts "Loading Games from CSV file: #{filename}"

csv_data = File.read(filename)
games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |g|
  platform = Platform.find_or_create_by(title: g["platform"])
  genre = Genre.find_or_create_by(genre_name: g["genre"])

  if platform&.valid?
    game = platform.games.create(
      name:         g["name"],
      release_date: g["release_date"],
      description:  g["description"],

      price:        g["price"],
      developer:    g["developer"],
      cover_art:    g["cover_art"],
      on_sale:      g["on_sale"],
      sale_price:   g["sale_price"]
    )
  end

  # genre = Genre.find_or_create_by(name: g["genre"])

  # platform.games.update(genre_id: genre["id"])

  GameGenre.create(game: game, genre: genre)
end

10.times do
  game = Game.all.sample(2)

  order = Order.create(total_price: 0)

  game.each do |g|
    next unless order&.valid?

    order.ordered_games.create(
      game_id:    g.id,
      unit_price: g.price,
      quantity:   2
    )
  end
  # order.update(total_price: game["price"])
end

Page.create(
  title:     "About",
  content:   "Hi! Thanks for visiting our about page!",
  permalink: "about_us"
)

Page.create(
  title:     "Contact Us",
  content:   "Hi! Thanks for visiting our contact page!",
  permalink: "contact"
)

puts "Created #{Platform.count} developers"
puts "Created #{Game.count} games"
puts "Created #{Order.count} orders"
puts "Created #{OrderedGame.count} ordered games"
puts "Created #{Page.count} pages"
puts "Created #{Genre.count} genres"
puts "Created #{GameGenre.count} game genres"
