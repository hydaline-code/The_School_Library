# choices_spec.rb
require_relative '../user_choice'
require_relative '../app'  # Assuming you have an App class

RSpec.describe Choices do
  let(:app) { instance_double('App') }

  describe '.user_choices' do
    context 'when choice is 1' do
      it 'calls app.list_all_books' do
        expect(app).to receive(:list_all_books)
        described_class.user_choices(1, app)
      end
    end

    context 'when choice is 2' do
      it 'calls app.list_all_people' do
        expect(app).to receive(:list_all_people)
        described_class.user_choices(2, app)
      end
    end

    context 'when choice is 3' do
      it 'calls app.create_a_person' do
        expect(app).to receive(:create_a_person)
        described_class.user_choices(3, app)
      end
    end

    context 'when choice is 4' do
      it 'calls app.create_book' do
        expect(app).to receive(:create_book)
        described_class.user_choices(4, app)
      end
    end

    context 'when choice is 5' do
      it 'calls app.create_rental' do
        expect(app).to receive(:create_rental)
        described_class.user_choices(5, app)
      end
    end

    context 'when choice is 6' do
      it 'calls app.list_all_rentals' do
        expect(app).to receive(:list_all_rentals)
        described_class.user_choices(6, app)
      end
    end

    context 'when choice is 7' do
      it 'exits the app' do
        expect { described_class.user_choices(7, app) }.to raise_error(SystemExit)
      end
    end

    context 'when choice is invalid' do
      it 'prints an error message' do
        expect { described_class.user_choices(8, app) }
          .to output("Invalid choice. Please enter a number between 1 and 7.\n").to_stdout
      end
    end
  end
end
