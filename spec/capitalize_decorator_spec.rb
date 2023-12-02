
require_relative '../capitalize_decorator'
require_relative '../nameable' 

RSpec.describe CapitalizeDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'hydaline') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct name' do
      expect(decorator.correct_name).to eq('Hydaline')
    end
  end
end
