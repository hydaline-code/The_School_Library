class Book
  attr_accessor :title, :author
  attr_accessor :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_books(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental
  end
end
