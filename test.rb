require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'books'
require_relative 'rental'

#  usage
person = Person.new(name: 'maximilianus', age: 22)
puts "Original Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Name: #{capitalized_trimmed_person.correct_name}"

#  usage
classroom = Classroom.new('Room 200')
classroom2 = Classroom.new('Room 202')

student1 = Student.new(classroom:, name: 'John', age: 18)
student2 = Student.new(classroom:, name: 'Alice', age: 17)
student3 = Student.new(classroom:, name: 'Johnny', age: 28)
student4 = Student.new(classroom:, name: 'Alic', age: 27)

classroom.adding_student(student1)
classroom.adding_student(student2)
classroom2.adding_student(student3)
classroom2.adding_student(student4)

puts student1.classroom.label
puts "Student Name: #{student1.name}"
puts student2.classroom.label
puts student3.classroom.label
puts student4.classroom.label

puts classroom.students.length
puts classroom2.students.length

#  usage

# Create persons
person1 = Person.new(name: 'chacha', age: 25)
person2 = Person.new(name: 'hydae', age: 22)

# Create books
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')

# Rent books
rental1 = Rental.new('2023-11-16', person1, book1)
rental2 = Rental.new('2023-11-17', person2, book2)

# Associations
puts "Person1's Rentals: #{person1.rentals.map { |r| r.book.title }}"
puts "Rental1 Date: #{rental1.date}"
puts "Person2's Rentals: #{person2.rentals.map { |r| r.book.title }}"
puts "Rental2 Date: #{rental2.date}"

puts "Book1's Rentals: #{book1.rentals.map { |r| r.person.name }}"
puts "Book2's Rentals: #{book2.rentals.map { |r| r.person.name }}"
