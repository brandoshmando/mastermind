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

    menu = "Welcome to Mastermind!\n"
    it "outputs list of options for user" do
      expect { master.main_menu }.to output(menu).to_stdout
    end
  end
end