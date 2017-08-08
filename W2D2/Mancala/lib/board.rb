require 'byebug'
class Board
  attr_accessor :cups

  attr_reader :current_player

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless [6, 13].include?(idx)
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (1..12).cover?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    @current_player = current_player_name
    @current_player == @player1 ? skip = 13 : skip = 6
    i = 0
    stones = @cups[start_pos].size
    stones.times do
      i += 1
      i += 1 if next_pos(start_pos, i) == skip
      @cups[next_pos(start_pos, i)] << @cups[start_pos].pop
    end
    render
    next_turn(next_pos(start_pos, i))
  end

  def next_pos(pos, i = 1)
    pos -= 14 until pos + i <= 13
    pos + i
  end

  def next_turn(ending_cup_idx)
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif @cups[ending_cup_idx].size > 1
      ending_cup_idx
    elsif @cups[ending_cup_idx].size == 1
      :switch
    else
      raise 'not sure how you got here'
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].flatten.empty? || @cups[7..12].flatten.empty?
  end

  def winner
    case @cups[6].size <=> @cups[13].size
    when 0
      :draw
    when 1
      @player1
    when -1
      @player2
    end
  end
end
