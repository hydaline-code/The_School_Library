require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'

# Example usage
person = Person.new(name: 'maximilianus', age: 22)
puts "Original Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Name: #{capitalized_trimmed_person.correct_name}"


# Example usage
classroom = Classroom.new("Room 200")
classroom2 = Classroom.new("Room 202")

student1 = Student.new(classroom: classroom, name: 'John', age: 18)
student2 = Student.new(classroom: classroom, name: 'Alice', age: 17)
student3 = Student.new(classroom: classroom, name: 'Johnny', age: 28)
student4 = Student.new(classroom: classroom, name: 'Alic', age: 27)

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
