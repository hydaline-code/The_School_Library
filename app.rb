require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'books'
require_relative 'rental'

class PersonFactory
  def self.create_person(person_type, name, age, options = {})
    case person_type
    when '1'
      create_student(name, age, options)
    when '2'
      create_teacher(name, age, options)
    else
      raise 'Invalid person type'
    end
  end

  private

  def self.create_student(name, age, options)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(name: name, age: age, parent_permission: parent_permission)
  end

  def self.create_teacher(name, age, options)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(name: name, age: age, specialization: specialization)
  end
end

class BookFactory
  def self.create_book
    puts 'Enter attributes for your book:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
  end
end

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
    @people.each { |person| puts person_info(person) }
  end

  def create_a_person
    begin
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      person_type = gets.chomp
      raise 'Invalid option' unless %w[1 2].include?(person_type)

      print 'Age (must be a positive integer): '
      age = gets.chomp.to_i
      raise 'Invalid age' unless age.positive?

      print 'Name: '
      name = gets.chomp

      person = PersonFactory.create_person(person_type, name, age)
      @people << person
      puts 'Person created successfully'
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end

  def create_book
    @books << BookFactory.create_book
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_book_list
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    display_people_list
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
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
      puts "#{person.name} has not done any rentals"
    else
      puts 'Rentals for: '
      rentals.each { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
    end
  end

  private

  def person_info(person)
    if person.is_a?(Student)
      "[Student]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    elsif person.is_a?(Teacher)
      "[Teacher] Name: #{person.name}, ID: #{person.id},  Age: #{person.age}"
    else
      'Invalid either student or teacher please'
    end
  end

  def display_book_list
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def display_people_list
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end
