require_relative '../person'
require 'rspec'

RSpec.describe Person do
  let(:person) { Person.new(name: 'John Doe', age: 25) }

  describe '#initialize' do
    it 'creates a new person with default values' do
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(25)
      expect(person.rentals).to be_empty
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is of age' do
      expect(person.of_age?).to be(true)
    end
  end
end
