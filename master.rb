class Master
  #Runs program
  def self.run
    master = Master.new
    master.clear_terminal
    master.main_menu
  end
  #Prints
  def main_menu
    puts """
        Welcome to Mastermind
    ------------------------------
               Main Menu
    ------------------------------
    Select from the following:

    [1] 1 player
    [2] 2 player
    [3] vs. Computer
    [4] Exit
    ------------------------------
    """
  end
  #Clears terminal
  def clear_terminal
    puts "\e[H\e[2J"
  end
end
Master.run