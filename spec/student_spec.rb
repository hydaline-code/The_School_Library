require_relative '../student'
require_relative '../classroom'
require 'rspec'

RSpec.describe Student do
  let(:student) { Student.new }

  describe '#initialize' do
    it 'creates a new student with default values' do
      expect(student.name).to eq('Unknown')
      expect(student.age).to eq(0)
      expect(student.instance_variable_get(:@parent_permission)).to be true
      expect(student.classroom).to be_nil
    end
  end

  describe '#play_hooky' do
    it 'returns ¯\\(ツ)/¯' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#add_a_classroom' do
    it 'sets the classroom and adds the student to the classroom' do
      classroom = Classroom.new('A101')
      expect(classroom.students).not_to include(student)

      student.add_a_classroom(classroom)

      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it 'does not add the student if already in the classroom' do
      classroom = Classroom.new('A102')
      classroom.adding_student(student)

      student.add_a_classroom(classroom)

      expect(student.classroom).to eq(classroom)
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
