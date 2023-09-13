require 'json'
require_relative 'game'
require_relative 'author'

class GameApp
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []

    # Load data from the JSON file, if it exists
    load_data
  end

  def list_games
    if @games.empty?
      puts 'No games available'
    else
      puts 'List of Games:'
      @games.each_with_index do |game, i|
        puts "Number: #{i + 1}, Title: #{game.title}, Multiplayer: #{game.multiplayer},
         Last Played: #{game.last_played_at}, Archived: #{game.archived}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors available'
    else
      puts 'List of Authors:'
      @authors.each_with_index do |author, i|
        puts "Number: #{i + 1}, Name: #{author.full_name}, Published Games: #{author.published_items.count}"
      end
    end
  end

  def add_game
    puts 'Enter title: '
    title = gets.chomp
    puts 'Is it multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    puts 'Enter last played date (yyyy-mm-dd): '
    last_played_at = Date.parse(gets.chomp)

    game = Game.new(nil, Date.today, false, title, multiplayer, last_played_at)
    @games << game

    puts 'Game added successfully'

    # Save data to the JSON file after adding a game
    save_data
  end

  private

  def load_data
    if File.exist?('game.json')
      data = JSON.parse(File.read('game.json'))

      # Load games and authors from the JSON file
      @games = data['games'].map { |game_data| Game.new(*game_data) }
      @authors = data['authors'].map { |author_data| Author.new(*author_data) }
    end
  end

  def save_data
    data = {
      'games' => @games.map(&:to_h),
      'authors' => @authors.map(&:to_h)
    }

    # Save data to the JSON file
    File.write('game.json', JSON.generate(data))
  end
end
