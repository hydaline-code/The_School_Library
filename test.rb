require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Example usage
person = Person.new(name: 'maximilianus', age: 22)
puts "Original Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Name: #{capitalized_trimmed_person.correct_name}"
