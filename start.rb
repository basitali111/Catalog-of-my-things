require './app'

class Start
  def initialize
    @app = App.new
  end

  def start_app(selection)
    if selection < 7 && selection.positive?
      list_items(selection)
    elsif selection > 6 && selection < 10
      add_item(selection)
    else
      puts 'Kindly select from 1 to 10 only'
    end
  end

  # list items
  def list_items(selection)
    case selection
    when 1
      @app.book.list_books
    when 2
      @app.music_albums.list_music_albums
    when 3
      @app.games.list_games
    when 4
      @app.music_albums.list_genres
    when 5
      @app.labels.list_labels
    else
      @app.authors.list_authors
    end
  end

  # add item
  def add_item(selection)
    case selection
    when 7
      @app.book.add_book
    when 8
      @app.music_albums.add_music_album
    else
      @app.games.add_game
    end
  end
end
