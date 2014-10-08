class Master
  require_relative 'lib/prompt.rb'
  require_relative 'game.rb'
  include Prompt
  #Runs program
  def self.run
    master = Master.new
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
    $stdin.gets
  end

  def option_caller
    while true
      input = user_input.to_i
      if input == 1
        puts "Yup1"
      elsif input == 2
        puts "Yup2"
      elsif input == 3
        return
      else
        puts "Please enter a valid option"
        next
      end
    end
  end

  def game_config(num_players)
    num_players.times do |i|
      position = i + 1 == 1 ? "one" : "two"
      print_prompt(Prompt::PLAYER_PROMPT)
      name = user_input.chomp
      # @game.player_"#{position}" = Player.new(name)
    end

  end
end
Master.run