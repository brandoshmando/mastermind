class Game
  require_relative 'computer.rb'
  attr_accessor :round_counter

  def initialize
    @players = []
    @rounds = []
    @round_counter = nil
    # @possible_points = something
  end

  def add_player(player)
    @players << player
  end
end