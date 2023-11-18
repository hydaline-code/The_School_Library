class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.rent_books(self)
    person.rent_books(self)
  end
end
