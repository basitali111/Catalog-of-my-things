require './music_album'
require './genre'
require 'json'

class MusicAlbumsModule
  attr_reader :music_albums, :genres

  def initialize
    # music_albums file
    @albums_file_location = 'storage/music_albums.json'
    albums_file = File.open(@albums_file_location)
    @music_albums = albums_file.size.zero? ? [] : JSON.parse(albums_file.read)
    albums_file.close

    # genres file
    @genres_file_location = 'storage/genres.json'
    genres_file = File.open(@genres_file_location)
    @genres = genres_file.size.zero? ? [] : JSON.parse(genres_file.read)
    genres_file.close
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

    # store genre
    store_genre(Genre.new(genre))
    puts 'Music album created successfully'
  end

  def store_album(album)
    album = album.to_json
    @music_albums << album

    file = File.open(@albums_file_location, 'w')
    file.write(JSON[@music_albums])
    file.close
  end

  def store_genre(created_genre)
    created_genre = created_genre.to_json
    @genres << created_genre

    file = File.open(@genres_file_location, 'w')
    file.write(JSON[@genres])
    file.close
  end

  # list albums
  def list_music_albums
    if @music_albums.empty?
      puts 'Sorry, the music_albums list is currently empty'
    else
      @music_albums.each_with_index do |music_album, i|
        puts "#{i + 1}. Genre: \"#{music_album['genre']}\", Author: #{music_album['author']}"
      end
    end
  end

  # list genres
  def list_genres
    if @genres.empty?
      puts 'Sorry, the genres list is currently empty'
    else
      @genres.each_with_index do |genre, i|
        puts "#{i + 1}. Name: \"#{genre['name']}\""
      end
    end
  end
end
