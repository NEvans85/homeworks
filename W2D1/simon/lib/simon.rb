
require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)


  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    puts game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    @game_over = require_sequence
    unless @game_over
      puts round_success_message
      @sequence_length += 1
      sleep(2)
    end
  end

  def ten_blank_lines
    "\n\n\n\n\n\n\n\n\n\n"
  end

  def show_sequence
    color_disp_hash = {'red' => "\nRED\n\n",
                       'blue' => "     BLUE\n\n\n",
                       'green' => "\n         GREEN\n\n",
                       'yellow' => "\n\n    YELLOW\n"}
    add_random_color
    @seq.each do |color|
      clear_screen
      print ten_blank_lines
      puts color_disp_hash[color]
      sleep(1)
      clear_screen
      sleep(0.2)
    end
  end

  def require_sequence
    puts 'Input the sequence in the order it appeared.'
    sequence_length.times do
      test_seq = deepdup(@seq)
      input = gets.chomp
      return true unless test_seq.unshift.first == input
    end
    false
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    'SUCCESS!! GET READY FOR THE NEXT ROUND'
  end

  def game_over_message
    "WRONG! GAME OVER. \n
     You remembered #{@sequence_length - 1} colors."
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def deepdup(array)
    deepdup = []
    array.each { |el| deepdup << el.dup }
    deepdup
  end

  def clear_screen
    system('clear')
  end
end

game = Simon.new
game.play
