class Game
  require_relative 'computer'
  require_relative 'player'


  def self.play
    game = new
    game.main_menu
  end

  def initialize
    @player = Player.new
    @rounds = []
  end

  def main_menu
    clear_terminal

    puts "
          Welcome to Mastermind
      ------------------------------
                 Main Menu
      ------------------------------
      Select from the following:

      [1] New Game
      [2] Exit
      ------------------------------
      "
    option_call(player_input)
  end

  def player_input
    print ">"
    gets.chomp
  end

  def clear_terminal
    puts "\e[H\e[2J"
  end

  def option_call(option)
    while true
      case option.to_i
      when 1
        config_game
        return
      when 2
        puts "Buh Bye now!"
        return
      else
        puts "Please enter a valid option:"
        option = player_input
        next
      end
    end
  end

  def config_game
    clear_terminal
    puts "
      --------------------
      Please enter a name:
      "
    @player.name = player_input
    execute_game
  end

  def execute_game
    clear_terminal
    puts "
      Bring it on #{@player.name}!
      ----------------------------
      R = Red
      G = Green
      O = Orange
      Y = Yellow
      B = Blue
      P = Purple

      Please enter four of the letters
      from above that correspond to a color
      in any order of your choosing. Colors
      may be used multiple times.
      ------------------------------
    "
  end
end

Game.play