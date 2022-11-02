require './genre'
require './music_album'

describe 'add_genre method' do
  it 'returns an array with one music album object' do
    music_album = MusicAlbum.new(2000, true)
    genre = Genre.new('Bongo')
    music_album.add_genre(genre)
    expect(music_album.genre).to eq(genre)
  end
end

describe 'can_be_archived? method' do
  it 'returns true if on sportfy and published_date is older than 10 years, else it returns false' do
    music_album = MusicAlbum.new(2000, true)
    expect(music_album.can_be_archived?).to eq(true)
  end
end
