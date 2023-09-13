require 'json'
require 'rspec'
require './genre_music'

describe GenreMusic do
  let(:genre) { GenreMusic.new(1, 'Robert', []) }

  describe '#add_item' do
    it 'adds an item to the genre' do
      item = double('item')
      genre.add_item(item)

      # Check if the items array in the genre now contains the added item
      expect(genre.items).to include(item)
    end
  end
end
