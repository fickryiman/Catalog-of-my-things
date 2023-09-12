require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'game' # Include the game.rb file
require_relative 'book_app'

def start
  puts "\nWelcome to Catalog of Things App! \n"

  loop do
    options_menu
    
    print "\nEnter your choice: "
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
  puts '3. List All Games'
  puts "4. List All Books Label (e.g. 'Gift', 'New')"
  puts "5. List All Music Genres (e.g 'Comedy', 'Thriller')"
  puts "6. List All Games Authors (e.g. 'Stephen King')"
  puts '7. Add a Book'
  puts '8. Add a Music Album'
  puts '9. Add a Game'
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
    puts 'user chooses 2. List All Music Albums'
  when 5
    puts "user chooses 5. List All Music Genres (e.g 'Comedy', 'Thriller')"
  when 8
    puts 'user chooses 8. Add a Music Album'
  end
end

def game_menu(user_input)
  case user_input
  when 3
    puts 'user chooses 3. List All Games'
  when 6
    puts "user chooses 6. List All Games Authors (e.g. 'Stephen King')"
  when 9
    puts 'user chooses 9. Add a Game'
  end
end

start
