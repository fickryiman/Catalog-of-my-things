require_relative '/game' # Assuming your Game class is defined in game.rb
require 'date' # You'll need this for Date.today in some tests
require 'json' # You'll need this for JSON parsing in some tests
require 'rspec'

describe Game do
  let(:game) do
    Game.new(1, Date.new(2022, 1, 1), false, true, Date.new(2022, 1, 15))
  end

  describe '#can_be_archived?' do
    context 'when the last played date is more than 2 years ago' do
      it 'returns true' do
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the last played date is less than 2 years ago' do
      it 'returns false' do
        game.last_played_at = Date.new(2023, 1, 1)
        expect(game.can_be_archived?).to be false
      end
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the game' do
      json_data = game.to_json
      parsed_data = JSON.parse(json_data)

      expect(parsed_data['id']).to eq(1)
      expect(parsed_data['publish_date']).to eq('2022-01-01')
      expect(parsed_data['archived']).to be false
      expect(parsed_data['multiplayer']).to be true
      expect(parsed_data['last_played_at']).to eq('2022-01-15')
    end
  end
end
