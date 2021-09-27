class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0
    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % 20
    store[bucket_idx] << num
  end

  def remove(num)
    bucket_idx = num % 20
    store[bucket_idx].delete(num)
  end

  def include?(num)
    bucket_idx = num % 20
    store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def inspect

  end

  def insert(num)
    resize! if count >= num_buckets
    bucket_idx = num % num_buckets
    if !store[bucket_idx].include?(num)
      store[bucket_idx] << num
      self.count += 1
      true
    else
      false
    end
  end

  def remove(num)
   if self[num].include?(num)
    self[num].delete(num)
    self.count -= 1
   end
  end

  def include?(num)
    bucket_idx = num % num_buckets
    store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_idx = num % num_buckets
    store[bucket_idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_store = Array.new(new_num_buckets) { Array.new }
    store.flatten.each do |num|
      bucket_idx = num % new_num_buckets
      new_store[bucket_idx] << num
    end
    @store = new_store
  end
end
