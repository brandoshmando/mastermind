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
    option_caller
  end
  #Clears terminal
  def clear_terminal
    puts "\e[H\e[2J"
  end

  def user_input
    input = gets
    input ||= ''
    input.chomp
  end

  def option_caller
    while true
      print ">"
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
end
Master.run