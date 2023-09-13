require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'game_app'

APP = GameApp.new

def start
  puts "\nWelcome to Catalog of Things App!\n"

  loop do
    options_menu

    print "\nEnter the options number: "
    user_input = gets.chomp.to_i

    case user_input
    when 1
      APP.list_games
    when 2
      APP.list_authors
    when 3
      APP.add_game
    when 0
      puts 'User chooses 0. Quit / Exit from App'
      puts
      exit!
    end
  end
end

def options_menu
  puts "\nPlease select the options number: "
  puts '1. List All Games'
  puts '2. List All Authors (e.g. "Stephen King")'
  puts '3. Add a Game'
  puts '0. Quit / Exit from App'
end

start
