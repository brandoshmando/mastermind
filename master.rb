class Master
  require_relative 'prompt.rb'

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
        puts "Yup!"
      elsif input == 2
        puts "Yup2!"
      elsif input == 3
        puts "Yup3!"
      else
        puts "Please enter a valid option"
        next
      end
    end
  end

  def add_players(num_of_players)
    num_of_players.times do |i|
      position = i == 1 ? "one" : "two"
      print_prompt(Prompt::PLAYER_NAME)
      name = user_input
      @game.add(Player.new(name, i))
    end
  end
end
Master.run