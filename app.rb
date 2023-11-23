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
        puts "[Student]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id},  Age: #{person.age},
        "
      else
        puts 'Invalid either student or teacher please'
      end
    end
  end

  def create_a_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp
    if person_type != "1" && person_type != "2"
      puts "Invalid option"
      return
    end
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    person = 
     if person_type == "1"
        print "Has parent permission? [Y/N]: "
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == "y"
        person = Student.new(name: name, age: age, parent_permission: parent_permission)
      elsif person_type == "2"
        print "Specialization: "
        specialization = gets.chomp
        person = Teacher.new(name: name, age: age, specialization: specialization)
      end

    @people << person
    puts "Person created successfully"
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

  def create_rental # rubocop:todo Metrics/MethodLength
    puts 'Rental details:'
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
