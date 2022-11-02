require './music_album'
require 'json'

class MusicAlbumsModule
  attr_reader :music_albums

  def initialize
    # music_albums file
    @albums_file_location = 'storage/music_albums.json'
    albums_file = File.open(@albums_file_location)
    @music_albums = albums_file.size.zero? ? [] : JSON.parse(albums_file.read)
    albums_file.close
  end

  # add music album
  def add_music_album
    print 'Enter genre: '
    genre = gets.chomp

    print 'Enter author: '
    author = gets.chomp

    print 'Publication date: '
    publish_date = gets.chomp

    print 'On sportify? (yes or no ): '
    on_sportify = gets.chomp
    case on_sportify
    when 'Y', 'y', 'yes', 'Yes'
      on_sportify = true
    when 'n', 'N', 'no', 'No'
      on_sportify = false
    end

    album = MusicAlbum.new(publish_date, on_sportify)
    album.add_genre(genre)
    album.add_author(author)
    # store album
    store_album(album)
    puts 'Music album created successfully'
  end

  def store_album(album)
    album = album.to_json
    @music_albums << album

    file = File.open(@albums_file_location, 'w')
    file.write(JSON[@music_albums])
    file.close
  end
end
