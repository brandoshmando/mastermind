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

  describe "#main_menu" do
    #Temporary workaround
    menu = "\n        Welcome to Mastermind\n    ------------------------------\n               Main Menu\n    ------------------------------\n    Select from the following:\n\n    [1] 1 player\n    [2] 2 player\n    [3] vs. Computer\n    [4] Exit\n    ------------------------------\n    \n"

    it "outputs list of options for user" do
      expect { master.main_menu }.to output(menu).to_stdout
    end
  end

  describe "#clear_terminal" do
    it "should return nil" do
      expect(master.clear_terminal).to be(nil)
    end
  end

  describe "#user_input" do

    before { $stdin = StringIO.new("Some Test\n")}
    after { $stdin = STDIN }

    it "takes input from user and returns said input" do
      expect(master.user_input).to eq("Some Test")
    end
  end
end


