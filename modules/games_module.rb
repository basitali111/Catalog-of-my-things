require './game'
require 'json'

class GamesModule
  attr_reader :games

  def initialize
    # games file
    @games_file_location = 'storage/games.json'
    games_file = File.open(@games_file_location)
    @games = games_file.size.zero? ? [] : JSON.parse(games_file.read)
    games_file.close
  end

  # add game
  def add_game
    print 'Author: '

    print 'Multiplayer? (yes or no ): '
    multiplayer = gets.chomp

    print 'Enter last played date: '
    last_played_at = gets.chomp

    print 'Publication date: '
    publish_date = gets.chomp

    case multiplayer
    when 'Y', 'y', 'yes', 'Yes'
      multiplayer = true
    when 'n', 'N', 'no', 'No'
      multiplayer = false
    end

    game = Game.new(multiplayer, last_played_at, publish_date)
    # store game
    store_game(game)

    puts 'Game created successfully'
  end

  def store_game(game)
    game = game.to_json
    @games << game

    file = File.open(@games_file_location, 'w')
    file.write(JSON[@games])
    file.close
  end
end
