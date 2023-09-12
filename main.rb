require_relative 'book_app'
require_relative 'music_app'

APP = BookApp.new
App2 = MusicApp.new

def start
  puts "\nWelcome to Catalog of Things App! \n"

  loop do
    options_menu

    user_input = gets.chomp.to_i
    print "\nSelected Menu: #{user_input}\n"

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
    APP.list_all_books
  when 4
    APP.list_all_books_label
  when 7
    APP.add_book
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
    puts 'user chooses 3. List All Games'
  when 6
    puts "user chooses 6. List All Games Authors (e.g. 'Stephen King')"
  when 9
    puts 'user chooses 9. Add a Game'
  end
end

start
