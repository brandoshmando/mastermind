require_relative 'menu.rb'

class Master
  include Menu
  #Runs program
  def self.run
    master = Master.new
    master.clear_terminal
    master.main_menu
  end
  #Prints
  def main_menu
    puts Menu::START
  end
  #Clears terminal
  def clear_terminal
    puts "\e[H\e[2J"
  end
  def user_input
    $stdin.gets.chomp
  end
end
Master.run