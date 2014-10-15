class Master
  require_relative 'lib/prompt.rb'
  require_relative 'game.rb'
  include Prompt
  #Runs program
  def self.run
    $master = new
    $master.main_menu
  end

  def initialize
    @game = Game.new
  end

  #Prints a given string
  def print_prompt(prompt)
    puts prompt
  end

  def main_menu
    clear_terminal
    print_prompt(Prompt::START_MENU)
    option = user_input.to_i
    option_caller(option)
  end
  #Clears terminal
  def clear_terminal
    puts "\e[H\e[2J"
  end

  def user_input
    print ">"
    gets.chomp
  end

  def option_caller(option)
    while true
      if option == 1 || option == 2
        game_config(option)
        return $master.main_menu
      elsif option == 3
        puts "Buh Bye!"
        return
      else
        print_prompt(Prompt::VALID_INPUT)
        next
      end
    end
  end

  def game_config(option)
    #Creates players and adds them to game
    option.times do |i|
      position = i + 1 == 1 ? "one" : "two"
      print_prompt(
        "Player #{position}, please enter your name:
--------------------------------------")
      name = user_input
      @game.add_player(Player.new(name))
    end
    #Checks to see if the format will be 1 player vs computer and adds
    #a Computer player if that is the case
    comp_or_player(option)
    #Users input the number of rounds they would like to play
    print_prompt(Prompt::NUM_ROUNDS)
    while true
      rounds = user_input.to_i
      if rounds && rounds <= 10 && rounds.even?
        @game.round_counter = rounds
        execute_game
        return
      else
      print_prompt(Prompt::VALID_INPUT)
      next
      end
    end
  end

  def comp_or_player(option)
    if option == 1
      @game.add_player(Computer.birth)
    end
  end

  def execute_game
    while @game.round_counter > 0

    end
  end
end
Master.run


















