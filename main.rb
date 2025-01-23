# frozen_string_literal: true

require_relative 'lib/knight'

# Main class; just to include Knight module
class Main
  include Knight

  def initialize
    start = [5, 6]
    p possible_moves(start)
    print_moves(start)
  end
end

Main.new
