require_relative '../master.rb'

describe Master do
  let(:master) { Master.new }


  describe "#new" do
    it "creates a new instance of master" do
      expect(master).to be_instance_of(Master)
    end
  end
end