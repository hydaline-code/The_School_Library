require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    output=@nameable.correct_name
    if trimmed_output = output.length > 10 
       trimmed_output =output [0, 10]
    else 
      output=@nameable.correct_name
    end
  end
end