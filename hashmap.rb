class HashMap
  attr_reader :capacity, :load_factor

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @size = 0
    @buckets = Array.new(capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code.abs % @capacity
  end

  def set(key, value)
    index = hash(key)
    bucket = @buckets[index]
    
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end
    
    bucket << [key, value]
    @size += 1
    resize if @size.to_f / @capacity >= @load_factor
  end

  def get(key)
    index = hash(key)
    bucket = @buckets[index]
    bucket.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def has?(key)
    index = hash(key)
    @buckets[index].any? { |pair| pair[0] == key }
  end

  def remove(key)
    index = hash(key)
    bucket = @buckets[index]
    bucket.each_with_index do |pair, i|
      if pair[0] == key
        @size -= 1
        return bucket.delete_at(i)[1]
      end
    end
    nil
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  def keys
    @buckets.flatten(1).map { |pair| pair[0] }
  end

  def values
    @buckets.flatten(1).map { |pair| pair[1] }
  end

  def entries
    @buckets.flatten(1)
  end

  private

  def resize
    old_buckets = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    old_buckets.flatten(1).each { |key, value| set(key, value) }
  end
end
