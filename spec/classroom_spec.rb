
require_relative '../classroom'
require_relative '../student'
require 'rspec'

RSpec.describe Classroom do
  let(:classroom_label) { 'A101' }
  let(:classroom) { Classroom.new(classroom_label) }

  describe '#adding_student' do
    let(:student) { Student.new }

    it 'adds a student to the classroom and updates the student' do
      allow(student).to receive(:classroom=).once

      classroom.adding_student(student)

      expect(classroom.students).to include(student)
    end

    it 'does not add the student if already in the classroom' do
      classroom.adding_student(student)

      expect(student).not_to receive(:classroom=)

      classroom.adding_student(student)

      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
