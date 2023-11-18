class Classroom
  attr_accessor:label

  def initialize (label)
    @label=label
    @students = []
  end 

  def students
    @students
  end

  def adding_student(student)
    @students << student
    student.classroom = self
  end
end