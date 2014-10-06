class Master
  require_relative 'menu.rb'

  include Menu
  #Runs program
  def self.run
    master = Master.new
    master.clear_terminal
    master.main_menu
  end
  #Prints
  def print_menu(menu)
    puts menu
  end
  def main_menu
    print_menu(Menu::START)
    user_input
  end
  #Clears terminal
  def clear_terminal
    puts "\e[H\e[2J"
  end
  def user_input
    print ">"
    input = gets.chomp
  end
end
Master.run