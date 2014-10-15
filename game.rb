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
        #call a method
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
end

Game.play