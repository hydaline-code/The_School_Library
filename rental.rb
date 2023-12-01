class Rental
  attr_reader :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json(*_args)
    {
      'type' => 'rental',
      'date' => @date,
      'book_title' => @book.title,
      'person_name' => @person.name
    }.to_json
  end
end
