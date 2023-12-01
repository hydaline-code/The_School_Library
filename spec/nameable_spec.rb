require_relative '../nameable'
require 'rspec'

class NameableStub < Nameable
  def correct_name
    'StubbedName'
  end
end

RSpec.describe Nameable do
  describe '#correct_name' do
    it 'returns the correct name when stubbed' do
      nameable = NameableStub.new
      expect(nameable.correct_name).to eq('StubbedName')
    end

    it 'raises NotImplementedError for the original implementation' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
