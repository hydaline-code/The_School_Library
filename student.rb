require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom: nil, name: 'Unknown', age: 0, parent_permission: true)
    super(name:, age:, parent_permission:)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_a_classroom(classroom)
    @classroom = classroom
    classroom.adding_student(self)
  end
end
