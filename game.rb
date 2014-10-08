class Game
  require_relative 'computer.rb'
  attr_reader :player_one, :player_two

  def initialize
    @player_one = nil
    @player_two = Computer.new("Computer")
    @rounds = []
    @round_counter = 0
    # @possible_points = something
  end
end