require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom: nil, name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission, id: rand(1000..9999))
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_a_classroom(classroom)
    @classroom = classroom
    classroom.adding_student(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      'type' => 'student',
      'name' => @name,
      'age' => @age,
      'id' => @id
    }.to_json
  end
end
