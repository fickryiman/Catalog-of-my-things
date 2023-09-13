require_relative '../book'

describe Book do
  let(:label) { Label.new(1, 'Label Title', 'Label Color') }
  let(:book) { Book.new(1, 'Publisher', 'bad', Date.today, label) }

  describe '-> Method .can_be_archived?' do
    context 'when cover_state is not equal "bad"' do
      it 'returns false' do
        book.cover_state = 'good'
        expect(book.can_be_archived?).to be false
      end
    end
  end

  describe '-> Method .update_book' do
    let(:book_loader) { [] }
    let(:label_loader) { [] }

    before do
      allow(Book).to receive(:load_books).and_return(book_loader)
      allow(Label).to receive(:load_labels).and_return(label_loader)
    end

    it 'returns the updated data with a new book and label' do
      expect(Label).to receive(:new).with(1, 'Label Title', 'Label Color').and_return(label)
      expect(Book).to receive(:new).with(1, 'Publisher', 'bad', Date.today, label).and_return(book)

      data = Book.update_book(publisher: 'Publisher', cover_state: 'bad', publish_date: Date.today,
                                     label_title: 'Label Title', label_color: 'Label Color')

      expect(data[:book]).to eq(book)
      expect(data[:label]).to eq(label)
      expect(data[:label_loader]).to eq([label])
      expect(data[:book_loader]).to eq([book])
    end
  end

  describe '-> Method .save_books_to_json_file' do
    let(:books) { [book] }

    before do
      allow(File).to receive(:write)
      allow(book.label).to receive(:convert_to_hash).and_return({ title: 'Label Title', color: 'Label Color' })
    end

    it 'saves the books to JSON format' do
      expect(File).to receive(:write).with('books.json',
                                           JSON.generate([{ 'id' => 1, 'publisher' => 'Publisher',
                                                            'publish_date' => Date.today, 'cover_state' => 'bad',
                                                            'archived' => true, 'label' => { title: 'Label Title',
                                                                                             color: 'Label Color' } }]))

      Book.save_books_to_json_file(books)
    end
  end

  describe '-> Method .load_books' do
    context 'when books.json exists and is not empty' do
      before do
        allow(File).to receive(:exist?).with('books.json').and_return(true)
        allow(File).to receive(:empty?).with('books.json').and_return(false)
        allow(File).to receive(:read).with('books.json').and_return('[{ "id": 1, "publisher": "Publisher", ' \
                                                                    '"publish_date": "2023-07-13", ' \
                                                                    '"cover_state": "bad", ' \
                                                                    '"label": { "title": "Label Title", ' \
                                                                    '"color": "Label Color" } }]')
      end

      it 'loads the books from JSON data' do
        expect(Book).to receive(:new).with(1, 'Publisher', 'bad', Date.parse('2023-07-13'),
                                           { 'title' => 'Label Title', 'color' => 'Label Color' })

        Book.load_books
      end
    end

    context 'when books.json does not exist or is empty' do
      before do
        allow(File).to receive(:exist?).with('books.json').and_return(false)
        allow(File).to receive(:empty?).with('books.json').and_return(true)
      end

      it 'returns an empty array' do
        expect(Book.load_books).to eq([])
      end
    end
  end

  describe '-> Method .list_all_books' do
    let(:book_data) do
      [{ id: 1, publisher: 'Publisher', publish_date: Date.today, cover_state: 'bad',
         label: { title: 'Label Title', color: 'Label Color' } }]
    end

    before do
      allow(File).to receive(:read).with('books.json').and_return(book_data.to_json)
      # rubocop:disable Layout/LineLength
      allow do
        puts
      end.to output(/id: 1, publisher: Publisher, publish_date: #{Date.today}, cover_state: bad, label: Label Title, label-color: Label Color/).to_stdout
      # rubocop:enable Layout/LineLength
    end
  end
end