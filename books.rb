class Book
  attr_accessor :title, :author, :rentals

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

  def to_json(*_args)
    {
      'type' => 'book',
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map { |rental| rental.to_json }
    }.to_json
  end
end
