require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id,:rentals

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @id = rand(1000..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_books(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.rentals << rental
    rental
  end
end
