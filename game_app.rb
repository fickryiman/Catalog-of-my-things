require 'json'
require_relative 'game'
require_relative 'author'

class GameApp
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []

    # Load data from the JSON file, if it exists
    load_data('game.json')
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
    id = Random.rand(1...1000)
    puts 'Enter title: '
    title = gets.chomp
    puts 'Is it multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    puts 'Enter last played date (yyyy-mm-dd): '
    last_played_at = Date.parse(gets.chomp)

    game = Game.new(id, Date.today, false, multiplayer, last_played_at)
    @games << game

    # Save data to the JSON file after adding a game
    save_data('game.json', @games)
    puts 'Game added successfully'

  end

  private

  def load_data(filename)
    if File.exist?(filename)
      JSON.parse(File.read(filename))
    else
      []
    end
  end
  
  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end
end
