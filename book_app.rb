require_relative 'book'
require_relative 'label'
require 'date'

class BookApp
  def initialize()
    @books = []
    @labels = []
  end

  def list_all_books
    if @books.empty?
      puts "\nNo Book added"
    else
      puts "\nList of Books Added:"
      @books.each do |book|
        puts '--------------------'
        puts "id: #{book.id}"
        puts "Publisher: #{book.publisher}"
        puts "Cover State: #{book.cover_state}"
        puts "Publish Date: #{book.publish_date}"
        puts "Label: #{book.label}"
      end
    end
  end

  def add_book
    id = Random.rand(1..1_000)

    print 'enter the book publisher: '
    publisher = gets.chomp

    print 'book cover state: '
    cover_state = gets.chomp

    publish_date = Date.today

    print 'book label title: '
    label = gets.chomp

    book = Book.new(id, publisher, cover_state, publish_date, label)
    @books << book

    puts 'Book has successfully created'
  end

  def list_all_books_label
    if @labels.empty?
      puts "\nNo Label added"
    else
      puts "\nList of Labels Added:"
      @labels.each do |label|
        puts '--------------------'
        puts "id: #{label.id}"
        puts "Title: #{label.title}"
        puts "Label Color: #{label.color}"
      end
    end
  end
end
