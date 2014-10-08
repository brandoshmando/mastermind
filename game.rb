class Game
  attr_reader :player_one, :player_two

  def initialize(player_one, player_two , num_rounds)
    @player_one = player_one
    @player_two = player_one
    @rounds = []
    @round_counter = num_rounds
    # @possible_points = something
  end
end