require_relative 'app'
require './display'
require './user_choice'

print '***************************************
*****Welcome to your school Library****
***************************************'

app = App.new

 loop do   
  Menu.display
  print 'Enter your choice selecting a number: '
  choice = gets.chomp.to_i
Choices.user_choices(choice, app)
 end
main
