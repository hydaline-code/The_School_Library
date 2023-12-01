class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  attr_reader :students

  def adding_student(student)
    @students << student
    student.add_a_classroom(self)
  end
end
