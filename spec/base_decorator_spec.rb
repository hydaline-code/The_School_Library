require_relative '../base_decorator'
require 'rspec'

RSpec.describe BaseDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Test Name') }
  let(:decorator) { BaseDecorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct name from the decorated object' do
      expect(decorator.correct_name).to eq('Test Name')
    end
  end
end
