require_relative '../books'
require 'rspec'

RSpec.describe Book do
  let(:book) { Book.new('Test Book', 'Test Author') }

  describe '#initialize' do
    it 'creates a new book with title and author' do
      expect(book.title).to eq('Test Book')
      expect(book.author).to eq('Test Author')
      expect(book.rentals).to be_empty
    end
  end

  describe '#rent_books' do
    let(:person) { instance_double('Person') }

    it 'creates a new rental and adds it to the book' do
      allow(Rental).to receive(:new)
      expect(book.rentals).to be_empty

      book.rent_books(person, '2023-12-01')

      expect(Rental).to have_received(:new).with('2023-12-01', book, person)
      expect(book.rentals).not_to be_empty
    end
  end
end
