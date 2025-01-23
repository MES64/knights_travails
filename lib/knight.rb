# frozen_string_literal: true

# Knight module
module Knight
  AVAILABLE_MOVES = [[2, 1], [-2, 1], [2, -1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]].freeze
  BOARD_LIMITS = (0..7)

  def possible_moves(start)
    AVAILABLE_MOVES.map { |move| [start, move].transpose.map(&:sum) }.filter { |square| on_board(square) }
  end

  def print_moves(start)
    finishes = possible_moves(start)
    puts '--------------------------'
    BOARD_LIMITS.reverse_each do |y|
      print '|'
      BOARD_LIMITS.each { |x| print_square([x, y], start, finishes) }
      puts '|'
    end
    puts '--------------------------'
  end

  private

  def on_board(square)
    BOARD_LIMITS.include?(square[0]) && BOARD_LIMITS.include?(square[1])
  end

  def print_square(current, start, finishes)
    if start == current
      print ' N '
    else
      print finishes.include?(current) ? ' o ' : ' . '
    end
  end
end
