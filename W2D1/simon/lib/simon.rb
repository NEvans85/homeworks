
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

  def show_sequence
    color_disp_hash = {'red' => '\nRED',
                       'blue' => '     BLUE',
                       'green' => '\n         GREEN',
                       'yellow' => '\n\n    YELLOW'}
    add_random_color
    @seq.each do |color|
      puts color_disp_hash[color]
      sleep(0.25)
      system('clear')
    end
  end

  def require_sequence
    puts 'Input the sequence in the order it appeared.'
    puts 'Input the '
    sequence_length.times do
      test_seq = @seq.dup
      return false unless test_seq.unshift[0] == gets.chomp[0]
    end
    true
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    'SUCCESS!! GET READY FOR THE NEXT ROUND'
  end

  def game_over_message
    'WRONG! GAME OVER.'

  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

game = SIMON.new
game.play
