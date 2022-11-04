require './game'
require './author'
require 'json'

class GamesModule
  attr_reader :games

  def initialize
    # games file
    @games_file_location = 'storage/games.json'
    games_file = File.open(@games_file_location)
    @games = games_file.size.zero? ? [] : JSON.parse(games_file.read)
    games_file.close

    # authors file
    @authors_file_location = 'storage/authors.json'
    authors_file = File.open(@authors_file_location)
    @authors = authors_file.size.zero? ? [] : JSON.parse(authors_file.read)
    authors_file.close
  end

  # add game
  def add_game
    print "Author's first name: "
    author_first_name = gets.chomp

    print "Author's last name: "
    author_last_name = gets.chomp

    print 'Multiplayer? (yes or no ): '
    multiplayer = gets.chomp

    print 'Enter last played date: '
    last_played_at = gets.chomp

    print 'Publication date: '
    publish_date = gets.chomp

    game = Game.new(multiplayer_status(multiplayer), last_played_at, publish_date)
    game.add_author("#{author_first_name} #{author_last_name}")
    # store game
    store_game(game)

    # store author
    store_author(Author.new(author_first_name, author_first_name))

    puts 'Game created successfully'
  end

  def store_game(game)
    game = game.to_json
    @games << game

    file = File.open(@games_file_location, 'w')
    file.write(JSON[@games])
    file.close
  end

  def store_author(created_author)
    created_author = created_author.to_json
    @authors << created_author

    file = File.open(@authors_file_location, 'w')
    file.write(JSON[@authors])
    file.close
  end

  def multiplayer_status(multiplayer)
    case multiplayer
    when 'Y', 'y', 'yes', 'Yes'
      true
    when 'n', 'N', 'no', 'No'
      false
    end
  end
end
