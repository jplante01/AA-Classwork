require 'first_tdd'
# require rspec

describe Array do
  
  describe "#my_uniq" do
    it "when called with empty array, returns empty array" do
      expect([].my_uniq).to eq([])
    end

    it "if array already contains unique elements, return array" do
      expect([1,2,3,4].my_uniq).to eq([1,2,3,4])
    end
  
    it "returns an array containing only unique elements" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#twosum" do
    it "when called with empty array, returns empty array" do
      expect([].two_sum).to eq([])
    end
    
    it "if target array contains no pairs that sum to zero, return empty array" do
      expect([1,2,3,4,5].two_sum).to eq([])
    end

    it "when called returns an array of all pairs of elements that sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]]) 
    end
  end

  describe "#my_transpose" do
    subject(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    subject(:result) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }
    subject(:incorrect) { [[0,1], [0,2,4], [0, 5, 3, 4]] }
    subject(:incorrect_1) { [[0,1,9], [0,2,4]] }

    it "when called with empty array, returns empty array" do
      expect([].two_sum).to eq([])
    end
    it "raise error if sub arrays are not same length" do
      expect{incorrect.my_transpose}.to raise_error("Bad Array")
    end
    it "raise error if number of sub arrays is not equal to the length of the self" do
      expect{incorrect_1.my_transpose}.to raise_error("wrong number of arrays")
    end
    it "returns transposed matrix" do
      expect(rows.my_transpose).to eq(result)
    end
  end

  describe "#stock_picker" do
    subject(:calendar) {[1,4,7,2,3]}

    it "when called with empty array, returns empty array" do
      expect([].two_sum).to eq([])
    end

    it "all elements in calendar must be postive Integers" do
      expect{[-1,0,1,2,3].stock_picker}.to raise_error("stock must be a value")
    end

    it "raises error if passed array with one element"do 
      expect{[1].stock_picker}.to raise_error("no day to sell") 
    end

    it "returns the most profitable days to buy/sell" do
      expect(calendar.stock_picker).to eq([0,2])
    end

  end

end

