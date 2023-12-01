require_relative '../display'
require 'rspec'

RSpec.describe Menu do
  describe '.display' do
    it 'displays the menu options' do
      expect { Menu.display }.to output(/Here are your options:/).to_stdout
    end
  end
end
