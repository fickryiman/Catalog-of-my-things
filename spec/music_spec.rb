require 'json'
require 'rspec'
require './music_album'
require 'date'

describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when the album can be archived' do
      it 'returns true' do
        # Create a MusicAlbum instance with a publish date more than 10 years ago
        album = MusicAlbum.new(1, 'Publisher', 'Good', Date.today - (11 * 365), on_spotify: true)

        # Verify that can_be_archived? returns true
        expect(album.can_be_archived?).to be(true)
      end
    end

    context 'when the album cannot be archived' do
      it 'returns false' do
        # Create a MusicAlbum instance with a publish date less than 10 years ago
        album = MusicAlbum.new(2, 'Publisher', 'Good', Date.today - (9 * 365), on_spotify: true)

        # Verify that can_be_archived? returns false
        expect(album.can_be_archived?).to be(false)
      end

      it 'returns false if not on Spotify' do
        # Create a MusicAlbum instance with a publish date more than 10 years ago but not on Spotify
        album = MusicAlbum.new(3, 'Publisher', 'Good', Date.today - (11 * 365), on_spotify: false)

        # Verify that can_be_archived? returns false
        expect(album.can_be_archived?).to be(false)
      end
    end
  end
end
