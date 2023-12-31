require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'game' # Include the game.rb file
require_relative 'music_app'
require_relative 'game_app'

AppGame = GameApp.new
App2 = MusicApp.new

def start
  puts "\nWelcome to Catalog of Things App! \n"

  loop do
    options_menu

    print "\nEnter the options number: "
    user_input = gets.chomp.to_i

    case user_input
    when 1, 4, 7
      book_menu(user_input)
    when 2, 5, 8
      music_album_menu(user_input)
    when 3, 6, 9
      game_menu(user_input)
    when 0
      puts 'user chooses 0. Quit / Exit from App\n'
      puts
      exit!
    end
  end
end

def options_menu
  puts "\nPlease select the options number: "
  puts '1. List All Books'
  puts '2. List All Music Albums'

  puts '3. List All Games' # Added option for listing games
  puts "4. List All Books Label (e.g. 'Gift', 'New')"
  puts "5. List All Music Genres (e.g 'Comedy', 'Thriller')"
  puts "6. List All Games Authors (e.g. 'Stephen King')" # Added option for listing game authors
  puts '7. Add a Book'
  puts '8. Add a Music Album'
  puts '9. Add a Game' # Added option for adding a game

  puts '0. Quit / Exit from App'
end

def book_menu(user_input)
  case user_input
  when 1
    Book.list_all_books
  when 4
    Label.list_all_labels
  when 7
    Book.add_book
  end
end

def music_album_menu(user_input)
  case user_input
  when 2
    App2.list_music_album
  when 5
    App2.list_music_genre
  when 8
    App2.add_music_album
  end
end

def game_menu(user_input)
  case user_input
  when 3
    AppGame.list_games
  when 6
    AppGame.list_authors
  when 9
    AppGame.add_game
  end
end

start
