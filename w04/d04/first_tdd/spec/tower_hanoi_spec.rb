require "tower_hanoi"

describe Towers do
  subject(:tow) { Towers.new }

  describe "#initialize" do
    it "instance variable towers is a 2D array with 3 sub arrays" do 
      expect(tow.towers.is_a?(Array)).to be(true)
      expect(tow.towers.length).to eq(3)
    end
    it "calls populate method" do
      expect(Towers).to receive(:populate)
      Towers.new
    end
  end

  describe "#populate" do
    it "places all pieces on first index" do
      expect(tow[0]).to eq([3,2,1])
    end

    it "checks that the other arrays are empty" do
      expect(tow[1]
    end
  end
  
  describe "#read_tower" do #returns entire subarray
    it "returns sub array at specified index" do
      expect(tow.read_tower(0)).to eq(tow.towers[0])
      expect(tow.read_tower(1)).to eq(tow.towers[1])
      expect(tow.read_tower(2)).to eq(tow.towers[2])
    end
  end

  describe "#valid_move" do
    it "returns false if indexes are the same"
    it "returns false if index is out of bounds"
    it "raise error if your piece is larger than the top piece on end index"
  end

  describe "#move" do 
    it "takes in start index and end index"
    it "removes piece from start index"
    it "places piece on end index"
  end


end

