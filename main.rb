def start
  puts "\nWelcome to Catalog of Things App! \n"

  loop do
    options_menu

    user_input = gets.chomp.to_i
    print "\nSelected Menu: #{user_input}\n"

    case user_input
    when 1
      puts 'user chooses 1. List All Books'
    when 2
      puts 'user chooses 2. List All Music Albums'
    when 3
      puts 'user chooses 3. List All Games'
    when 4
      puts "user chooses 4. List All Books Label (e.g. 'Gift', 'New')"
    when 5
      puts "user chooses 5. List All Music Genres (e.g 'Comedy', 'Thriller')"
    when 6
      puts "user chooses 6. List All Games Authors (e.g. 'Stephen King')"
    when 7
      puts 'user chooses 7. Add a Book'
    when 8
      puts 'user chooses 8. Add a Music Album'
    when 9
      puts 'user chooses 9. Add a Game'
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

start
