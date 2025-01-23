# frozen_string_literal: true

require_relative 'lib/knight'

# Main class; just to include Knight module
class Main
  include Knight

  def initialize
    start = [3, 0]
    finish = [3, 0]
    path = knight_moves(start, finish)
    p path
    print_path(path)
  end
end

Main.new
# TODO: start knight_moves method
