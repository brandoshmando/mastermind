require_relative '../master.rb'

describe Master do
  let(:master) { Master.new }


  describe ".new" do
    it "creates a new instance of master" do
      expect(master).to be_instance_of(Master)
    end

    it "should have method main_menu" do
      expect(master).to respond_to :main_menu
    end
  end

  describe "#main_menu" do
    #Temporary workaround
    menu = "Welcome to Mastermind!\n\n---Main Menu---\n[1] 1 player\n[2] 2 player\n[3] vs. Computer\n[4] Exit\n"

    it "outputs list of options for user" do
      expect { master.main_menu }.to output(menu).to_stdout
    end
  end
end