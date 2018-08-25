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
    # system('clear')
    until game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over == true
      round_success_message
      add_random_color
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    # system('clear')
    # puts "Watch closely!"
    # sleep(2)
    # system('clear')
    # @seq.each do |color|
    #   puts "  "
    #   sleep(1)
    #   system('clear')
    #   puts "#{color}"
    #   sleep(2)
    #   system('clear')
    # end
  end

  def require_sequence
    puts 'Type the colors in order: (i.e "red blue green yellow")'
    guess = gets.chomp.split(" ")
    guess.each_with_index do |color, i|
      @seq.each_with_index do |color2, j|
        next if i != j
        @game_over = true unless color == color2
      end
    end

  end

  def add_random_color
    self.seq.push(COLORS.shuffle.last)
  end

  def round_success_message
    # system('clear')
    # puts "Great Job! You got it!"
  end

  def game_over_message
    # system('clear')
    # puts "Incorrect! Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
