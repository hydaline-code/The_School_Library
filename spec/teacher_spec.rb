require_relative '../teacher'
require 'rspec'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(age: 35, specialization: 'Math') }

  describe '#initialize' do
    it 'creates a new teacher with default values' do
      expect(teacher.name).to eq('Unknown')
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
    end

    it 'creates a new teacher with specified values' do
      teacher = Teacher.new(name: 'Johnson', age: 40, specialization: 'History')
      expect(teacher.name).to eq('Johnson')
      expect(teacher.age).to eq(40)
      expect(teacher.specialization).to eq('History')
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
