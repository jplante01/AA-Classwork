class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_str = ""
    self.each.with_index do |el, i|
      new_str += el.to_s + i.to_s
    end
    new_str.to_i ^ 9999
  end
end

class String
  def hash
    new_str = ""
    self.each_char do |char|
      new_str += char.ord.to_s 
    end
    new_str.to_i ^ 9999
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    p 0
  end
end
