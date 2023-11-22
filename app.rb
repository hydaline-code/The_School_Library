require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'books'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each { |book| puts "#{book.title} written by: #{book.author}" }
  end

  def list_all_people
    puts 'List of people:'
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Classroom: #{person.classroom}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Specialization: #{person.specialization}"
      else
        puts 'Invalid either student or teacher please'
      end
    end
  end

  def create_a_person
    print 'Enter your name: '
    name = gets.chomp
    print 'Enter your Age: '
    age = gets.chomp.to_i

    print "Are you a student or a teacher? (Enter 'student' or 'teacher'): "
    role = gets.chomp.downcase
    puts "You are a : #{role}"

    if role == 'student'
      print 'Classroom: '
      classroom = gets.chomp
      Student.new(classroom: classroom, name: name, age: age)
    elsif role == 'teacher'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(name: name, age: age, specialization: specialization)
    else
      puts 'Invalid role'
      return
    end

    @people << person
    puts "#{role.capitalize} #{name} created!"
  end

  def create_book
    puts 'Enter attributes for your book:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book '#{title}' by '#{author}' created."
  end

  def create_rental
    puts 'Enter the rental details:'
    list_all_people
    print 'Enter a person ID: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person is not found.'
      return
    end
    list_all_books
    print 'Enter the book Title: '
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts 'Book not found.'
      return
    end

    print 'Enter rental Date (YYYY-MM-DD): '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created for #{person.name} - #{book.title} on #{date}"
  end

  def list_all_rentals
    list_all_people
    print 'Enter a person ID: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end
    rentals = @rentals.select { |r| r.person == person }
    if rentals.empty?
      puts "#{person.name} has not done any  rentals"
    else
      puts "Rentals for #{person.name}: "
      rentals.each { |rental| puts "#{rental.book.title} - #{rental.date}" }
    end
  end
end
