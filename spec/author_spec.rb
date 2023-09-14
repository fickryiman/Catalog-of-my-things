require_relative '../author' # Assuming your Author class is defined in author.rb
require_relative '../game'   # Assuming you want to test the publish_item method
require 'rspec'
require 'date' # Add this line to require the 'date' library

describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:game)   { Game.new(1, Date.new(2022, 1, 1), false, true, Date.new(2022, 1, 15)) }

  describe '#publish_item' do
    it 'associates the author with the item' do
      author.publish_item(game)
      expect(game.author).to eq(author)
    end

    it 'adds the item to the author\'s published items' do
      author.publish_item(game)
      expect(author.published_items).to include(game)
    end
  end
end
