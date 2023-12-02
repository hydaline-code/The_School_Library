require_relative '../trimmer_decorator'
require_relative '../base_decorator'
require 'rspec'

RSpec.describe TrimmerDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Test Name') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the nameable has a name longer than 10 characters' do
      it 'trims the name to 10 characters' do
        expect(decorator.correct_name).to eq('Test Name')
      end
    end

    context 'when the nameable has a name exactly 10 characters long' do
      it 'does not trim the name' do
        allow(nameable).to receive(:correct_name).and_return('Exactly10')
        expect(decorator.correct_name).to eq('Exactly10')
      end
    end

    context 'when the nameable has a name shorter than 10 characters' do
      it 'does not trim the name' do
        allow(nameable).to receive(:correct_name).and_return('Short')
        expect(decorator.correct_name).to eq('Short')
      end
    end
  end
end
