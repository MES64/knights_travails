# frozen_string_literal: true

# Knight module can list the possible moves and print them on a board to the terminal
# It can also find the shortest path between 2 squares and print this path on a board
module Knight
  AVAILABLE_MOVES = [[2, 1], [-2, 1], [2, -1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]].freeze
  BOARD_LIMITS = (0..7)
  HORIZONTAL_LINE = '--------------------------'
  VERTICAL_LINE = '|'

  def possible_moves(start)
    AVAILABLE_MOVES.map { |move| [start, move].transpose.map(&:sum) }.filter { |square| on_board(square) }
  end

  def knight_moves(start, finish)
    return [] unless on_board(start) && on_board(finish)

    edges = edges_found(start, finish)
    shortest_path = [start]
    shortest_path.append(edges[shortest_path.last]) until shortest_path.last == finish
    shortest_path
  end

  def print_moves(start)
    finishes = possible_moves(start)
    puts HORIZONTAL_LINE
    BOARD_LIMITS.reverse_each do |y|
      print VERTICAL_LINE
      BOARD_LIMITS.each { |x| print_square([x, y], start, finishes) }
      puts VERTICAL_LINE
    end
    puts HORIZONTAL_LINE
  end

  def print_path(path)
    puts HORIZONTAL_LINE
    BOARD_LIMITS.reverse_each do |y|
      print VERTICAL_LINE
      BOARD_LIMITS.each { |x| print " #{path.index([x, y]) || '.'} " }
      puts VERTICAL_LINE
    end
    puts HORIZONTAL_LINE
  end

  private

  def on_board(square)
    BOARD_LIMITS.include?(square[0]) && BOARD_LIMITS.include?(square[1])
  end

  def edges_found(start, finish)
    edges = { finish => nil }
    queue = [finish]
    until edges.key?(start)
      current = queue.shift
      possible_moves(current).each { |dest| add_to_found(dest, current, edges, queue) unless edges.key?(dest) }
    end
    edges
  end

  def add_to_found(dest, current, edges, queue)
    edges[dest] = current
    queue.push(dest)
  end

  def print_square(current, start, finishes)
    if start == current
      print ' N '
    else
      print finishes.include?(current) ? ' o ' : ' . '
    end
  end
end
