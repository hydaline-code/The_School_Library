require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom: nil, name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
