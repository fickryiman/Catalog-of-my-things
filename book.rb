require_relative 'item'
require_relative 'label'
require 'date'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date
  attr_reader :id

  def initialize(id, publisher, cover_state, publish_date, label)
    super(id, publish_date, false)
    @id = id || Random.rand(1..1_000)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @label = label
    @archived = can_be_archived?
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def self.book_input
    book = {
      publisher: '',
      cover_state: '',
      publish_date: Date.today,
      label_title: '',
      label_color: ''
    }

    print 'enter the book publisher: '
    book[:publisher] = gets.chomp

    print 'book cover state: '
    book[:cover_state] = gets.chomp

    # publish date is by the today input date
    book[:publish_date] = Date.today

    print 'book label title: '
    book[:label_title] = gets.chomp

    print 'book label color: '
    book[:label_color] = gets.chomp

    book
  end

  def self.add_book
    entered_book = book_input
    load_books

    data = update_book(entered_book)

    book = data[:book]
    label = data[:label]
    book_loader = data[:book_loader]
    label_loader = data[:label_loader]

    add_book_to_item(entered_book, book, label)

    save_books_to_json_file(book_loader)
    label.save_labels_to_json_file(label_loader)
  end

  def self.add_book_to_item(entered_book, book, label)
    items = JSON.parse(File.read('items.json'), symbolize_names: true)
    item = Item.new(items.length + 1, entered_book[:publish_date], book.can_be_archived?)

    item.label = label
    label.add_item(item)

    puts 'Book has successfully added!'
  end

  def self.update_book(book_argument)
    book_loader = load_books
    label_loader = Label.load_labels

    label = Label.new(label_loader.length + 1, book_argument[:label_title], book_argument[:label_color])
    book = Book.new(book_loader.length + 1, book_argument[:publisher], book_argument[:cover_state],
                    book_argument[:publish_date], label)

    label_loader << label
    book_loader << book
    {
      book: book,
      label: label,
      book_loader: book_loader,
      label_loader: label_loader
    }
  end

  def self.save_books_to_json_file(books)
    json_book = books.map do |book|
      {
        'id' => book.id,
        'publisher' => book.publisher,
        'publish_date' => book.publish_date,
        'cover_state' => book.cover_state,
        'archived' => book.archived,
        'label' => book.label.is_a?(Hash) ? book.label : book.label.convert_to_hash
      }
    end
    File.write('books.json', JSON.generate(json_book))
  end

  def self.load_books
    return [] unless File.exist?('books.json') && !File.empty?('books.json')

    read_books_json = JSON.parse(File.read('books.json'))

    read_books_json.map do |read_book|
      book = Book.new(read_book['id'], read_book['publisher'], read_book['cover_state'],
                      Date.parse(read_book['publish_date']), read_book['label'])

      book
    end
  end

  def self.list_all_books
    puts 'All Books Listed: '
    books = JSON.parse(File.read('books.json'), symbolize_names: true)

    books.each do |book|
      puts "id: #{book[:id]}, Publisher: #{book[:publisher]}, Publish Date: #{book[:publish_date]}, " \
           "Cover State: #{book[:cover_state]}, Label: #{book[:label][:title]}, " \
           "Label Color: #{book[:label][:color]}"
    end
  end
end
