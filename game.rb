class Game
  require_relative 'computer'
  require_relative 'player'

  def initialize
    @player = Player.new
    @rounds = []
  end

  def add_player(player)
    @players << player
  end
end