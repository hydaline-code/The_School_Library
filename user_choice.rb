class Choices 
  def self.user_choices(choice, app)
    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_a_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_all_rentals
    when 7
      puts 'Exiting the app. Goodbye!'
      exit
    else
      puts 'Invalid choice. Please enter a number between 1 and 7.'
    end
  end
end