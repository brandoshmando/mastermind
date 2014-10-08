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

  #Prints
  def print_prompt(prompt)
    puts prompt
  end
  def main_menu
    print_prompt(Prompt::START_MENU)
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
        new_game
      elsif $user_input.to_i == 3
        puts "Buh Bye!"
        return
      else
        print_prompt(Prompt::VALID_INPUT)
        next
      end
    end
  end

  def new_game
    @game = Game.new
    game_config
  end

  def game_config
    #Creates players and adds them to game
    $user_input.to_i.times do |i|
      position = i + 1 == 1 ? "one" : "two"
      print_prompt(
        "Player #{position}, please enter your name:
--------------------------------------")
      name = user_input.chomp
      @game.add_player(Player.new(name))
    end
    #Checks to see if the format will be 1 player vs computer and adds
    #a Computer player if that is the case
    comp_or_player
    #Users input the number of rounds they would like to play
    print_prompt(Prompt::NUM_ROUNDS)
    while true
      user_input
      @game.round_counter = if $user_input.to_i && $user_input.to_i <= 10 && $user_input.to_i.even?
      else
      print_prompt(Prompt::VALID_INPUT)

      end
    end
  end

  def comp_or_player
    if $user_input.to_i == 1
      @game.add_player(Computer.birth)
    end
  end
end
Master.run