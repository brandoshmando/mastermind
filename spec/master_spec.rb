require_relative '../master.rb'

describe Master do
  let(:master) { Master.new }


  describe ".new" do
    it "creates a new instance of master" do
      expect(master).to be_instance_of Master
    end

    it "should have method main_menu" do
      expect(master).to respond_to :main_menu
    end

    it "should have method clear_terminal" do
      expect(master).to respond_to :clear_terminal
    end
  end

  describe "#print_menu" do
    it "prints the given menu constant to the terminal" do
      expect { allow(master).to receive(:print_menu).with("Test") }.to output("Test\n").to_stdout
    end
  end

  describe "#main_menu" do
    #Temporary workaround
    menu = "\n        Welcome to Mastermind\n    ------------------------------\n               Main Menu\n    ------------------------------\n    Select from the following:\n\n    [1] 1 player\n    [2] 2 player\n    [3] vs. Computer\n    [4] Exit\n    ------------------------------\n    \n>"

    it "outputs list of options for user" do
      expect { master.main_menu }.to output(menu).to_stdout
    end
  end

  describe "#clear_terminal" do
    it "should return nil" do
      expect(master.clear_terminal).to be(nil)
    end
  end
=begin
  Getting insane inconsistent results with this test.
  Sometimes it works fine, other times it throws an
  unable to load file 'gets' error...Too much time spent

  # describe "#user_input" do
  #   it "takes input from user and returns said input" do
  #     expect(master).to recieve(:user_input).and_return(input)
  #   end
  # end
=end
end


