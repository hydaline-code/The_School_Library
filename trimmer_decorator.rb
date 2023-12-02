require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    output = @nameable.correct_name
    if output.length > 10
      output [0, 10]
    else
      output
    end
  end
end
