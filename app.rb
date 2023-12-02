require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'books'
require_relative 'rental'
require 'json'

class PersonFactory
  def self.create_person(person_type, name, age)
    case person_type
    when '1'
      create_student(name, age)
    when '2'
      create_teacher(name, age)
    else
      raise 'Invalid person type'
    end
  end

  def self.create_student(name, age)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(name:, age:, parent_permission:)
  end

  def self.create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(name:, age:, specialization:)
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
  DATA_PATH = './data/'.freeze

  def initialize
    @people = []
    @books = []
    @rentals = []

    load_data_on_startup

    at_exit { save_data_to_json }
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
    save_data_to_json
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def create_book
    @books << BookFactory.create_book
    puts 'Book created successfully.'
    save_data_to_json
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

    person = find_person_by_name(@people[person_index].name)
    @rentals << Rental.new(date, @books[book_index], person)
    puts 'Rental created successfully'
    save_data_to_json
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
    if person.instance_of?(Student)
      "[Student]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    elsif person.instance_of?(Teacher)
      "[Teacher] Name: #{person.name}, ID: #{person.id},  Age: #{person.age}, Specialization: #{person.specialization}"
    else
      'Invalid either student or teacher please'
    end
  end

  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def display_book_list
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def find_person_by_name(name)
    @people.find { |person| person.name == name }
  end

  def display_people_list
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def save_data_to_json
    save_to_json("#{DATA_PATH}books.json", @books)
    save_to_json("#{DATA_PATH}people.json", @people)
    save_to_json("#{DATA_PATH}rentals.json", @rentals)
  end

  def load_data_on_startup
    load_data("#{DATA_PATH}people.json", Person, @people)
    load_data("#{DATA_PATH}books.json", Book, @books)
    load_data("#{DATA_PATH}rentals.json", Rental, @rentals)
  end

  def load_data(filename, data_type, container)
    return unless File.exist?(filename)

    file_content = File.read(filename)
    json_data = JSON.parse(file_content)

    deserialized_data = json_data.map do |json_object|
      case data_type.to_s
      when 'Person'
        load_person(json_object)
      when 'Book'
        load_book(json_object)
      when 'Rental'
        load_rental(json_object)
      end
    end

    container.concat(deserialized_data.compact)
  rescue StandardError => e
    puts "Error loading data from #{filename}: #{e.message}"
  end

  def load_person(json_object)
    case json_object['type']
    when 'student'
      Student.new(name: json_object['name'], age: json_object['age'])
    when 'teacher'
      Teacher.new(name: json_object['name'], age: json_object['age'], specialization: json_object['specialization'])
    end
  end

  def load_book(json_object)
    Book.new(json_object['title'], json_object['author'])
  end

  def load_rental(json_object)
    book = find_book_by_title(json_object['book_title'])
    person = find_person_by_name(json_object['person_name'])
    Rental.new(json_object['date'], book, person)
  end

  def save_to_json(filename, data)
    File.open(filename, 'w') do |file|
      file.puts JSON.generate(data)
    end
    puts 'Data saved successfully'
  end
end
