# frozen_string_literal: true

require_relative 'lib/knight'

# Main class; just to include Knight module
class Main
  include Knight

  def initialize
    start = [5, 6]
    p possible_moves(start)
    print_moves(start)
    p path = []
    print_path(path)
  end
end

Main.new
# TODO: start knight_moves method, maybe another print method for the final path found
#       with a number representing the order (0 start)
