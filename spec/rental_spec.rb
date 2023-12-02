# spec/rental_spec.rb
require_relative '../rental'
require_relative '../books'
require_relative '../student'
require 'json'
require 'rspec'

RSpec.describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:student) { Student.new(name: 'Hydaline', age: 18) }
  let(:date) { '2023-12-01' }

  describe '#initialize' do
    it 'creates a new rental with the provided date, book, and person' do
      rental = Rental.new(date, book, student)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(student)
    end
  end

  describe '#to_json' do
    it 'returns the JSON representation of the rental' do
      rental = Rental.new(date, book, student)
      expected_json = {
        'type' => 'rental',
        'date' => date,
        'book_title' => book.title,
        'person_name' => student.name
      }

      expect(JSON.generate(rental.to_json)).to eq(JSON.generate(expected_json))
    end

  end
end
