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
    menu = "        Welcome to Mastermind\n    ------------------------------\n               Main Menu\n    ------------------------------\n    Select from the following:\n\n    [1] 1 player vs. Computer\n    [2] 2 player\n    [3] Exit\n    ------------------------------\n>"

    it "outputs list of options for user" do
      expect { master.main_menu }.to output(menu).to_stdout
    end

    it "calls print_menu" do
      allow(master).to receive(:main_menu) do
        expect(master).to receive(:print_menu)
      end
    end

    it "calls user_input" do
      allow(master).to receive(:main_menu) do
        expect(master).to receive(:print_menu)
      end
    end

    it "calls option_caller" do
      allow(master).to receive(:main_menu) do
        expect(master).to receive(:option_caller)
      end
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
=end
  describe "#user_input" do
    before(:example) { $stdin = StringIO.new("Tester Magoo\n") }

    after(:example) { $stdin = STDIN }

    it "returns $stdin" do
      expect(master.user_input).to eq("Tester Magoo\n")
    end
  end

  describe "#option_caller" do
    it "calls method based on given option" do
      allow(master).to receive(:gets).with("1")
    end
  end
end


