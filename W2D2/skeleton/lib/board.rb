class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,i|
      4.times {cup << :stone} unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    total_stones = @cups[start_pos].count
    @cups[start_pos] = []
    hand = []
    total_stones.times {hand << :stone}
    i = start_pos
    until hand.empty?
      i += 1
      i = 0 if i > 13
      if start_pos < 6
        @cups[i] << hand.shift unless i == 13
      else
        @cups[i] << hand.shift unless i == 6
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
    ending_cup_idx
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
    side_one = @cups[0...6]
    side_two = @cups[7..12]
    return true if side_one.all? { |cup| cup.empty? }
    return true if side_two.all? {|cup| cup.empty?}
    false
  end

  def winner
    p1_count = @cups[6].count
    p2_count = @cups[13].count
    if @cups[6] == @cups[13]
      return :draw
    else
      p1_count > p2_count ? @player1 : @player2
    end
  end

end
