require './genre'
require './music_album'

describe 'add_item method' do
  it 'returns an array with one music album object' do
    music_album = MusicAlbum.new(2020, true)
    genre = Genre.new('Bongo')
    genre.add_item(music_album)
    expect(genre.items.length).to eq(1)
  end
end
