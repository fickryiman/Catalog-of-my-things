require 'date'
require_relative 'game'
require_relative 'author'

class GameApp
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def list_games
    if @games.empty?
      puts 'No games available'
    else
      @games.each_with_index do |game, i|
        puts "Number: #{i + 1}, Title: #{game.label}, Multiplayer: #{game.multiplayer},
         Last Played: #{game.last_played_at}, Archived: #{game.archived}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors available'
    else
      @authors.each_with_index do |author, i|
        puts "Number: #{i + 1}, Name: #{author.first_name} #{author.last_name},
         Published Games: #{author.published_items.count}"
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
  end
end
