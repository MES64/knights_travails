# frozen_string_literal: true

require_relative 'lib/knight'

# Main class; just to include the Knight module and use it
class Main
  include Knight

  def initialize
    square = [6, 6]
    p possible_moves(square)
    print_moves(square)
    start = [3, 0]
    finish = [3, 2]
    path = knight_moves(start, finish)
    p path
    print_path(path)
  end
end

Main.new
