class Master
  require_relative 'lib/prompt.rb'
  require_relative 'game.rb'
  include Prompt
  #Runs program
  def self.run
    master = new
    master.clear_terminal
    master.main_menu
  end

  def initialize
    @game = Game.new
  end
  #Prints
  def print_prompt(prompt)
    puts prompt
  end
  def main_menu
    print_prompt(Prompt::START_MENU)
    user_input
    option_caller
  end
  #Clears terminal
  def clear_terminal
    puts "\e[H\e[2J"
  end

  def user_input
    print ">"
    $user_input = gets.chomp
  end

  def option_caller
    while true
      user_input
      if $user_input.to_i == 1 || $user_input.to_i == 2
        game_config($user_input.to_i)
      elsif $user_input.to_i == 3
        return
      else
        print_prompt(Prompt::VALID_INPUT)
        next
      end
    end
  end

  def game_config(num_players)
    #Creates players and adds them to game
    num_players.times do |i|
      position = i + 1 == 1 ? "one" : "two"
      print_prompt(
        "Player #{position}, please enter your name:
--------------------------------------")
      name = user_input.chomp
      @game.add_player = Player.new(name)
    end
    #Checks to see if the format will be 1 player vs computer and adds
    #a Computer player if that is the case
    comp_or_player(num_players)
    #Users input the number of rounds they would like to play
    print_prompt(Prompt::NUM_ROUNDS)
    user_input
    @game.round_counter = if $user_input.to_i && $user_input.to_i <= 10 && $user_input.to_i.even?
    else
      print_prompt(Prompt::VALID_INPUT)
    end
  end

  def comp_or_player(num_players)
    if num_players == 1
      @game.add_player(Computer.birth)
    end
  end
end
Master.run