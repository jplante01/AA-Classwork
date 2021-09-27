class Array

  def my_uniq
    seen = []

    self.each do |el|
      seen << el if !seen.include?(el)
    end
    seen
  end

  def two_sum
    new_arr = []
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        # [-1, 0, 2, -2, 1]
        new_arr << [i, j] if self[i] + self[j] == 0
      end
    end

    new_arr
  end

  def my_transpose
    new_arr = []
    temp_arr = []

    if !self.all? { |sub_arr| sub_arr.length == self[0].length }
      raise "Bad Array"
    end
    
    raise "wrong number of arrays" if self.length != self[0].length

    self.each_index do |i|
      self.each_index do |j|
        temp_arr << self [j][i]
      end
      new_arr << temp_arr 
      temp_arr = []
    end


    new_arr
  end

  def stock_picker
    results = []

    raise "stock must be a value" if self.any? {|el| el < 0 || !el.is_a?(Integer)}

    raise "no day to sell" if self.length == 1

    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        results << [i,j]
      end
    end

    results.inject do |acc, el|
      buy, sell = acc
      if self[sell] - self[buy] < self[el[1]] - self[el[0]]
        el
      else
        acc
      end
    end
   
  end
  
end