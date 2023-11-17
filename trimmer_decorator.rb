require_relative 'BaseDecorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    output=@nameable.correct_name
    trimmed_output = output.length > 10 ? output [0, 10] : output
    trimmed_output
  end
end