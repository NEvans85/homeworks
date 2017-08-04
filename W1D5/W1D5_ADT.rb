class Stack
  def initialize
    @elements = []
  end

  def add(el)
    @elements.push(el)
  end

  def remove
    @elements.pop
  end

  def show
    puts @elements
  end
end

class Queue
  def initialize
    @elements = []
  end

  def enqueue(el)
    @elements.push(el)
  end

  def dequeue
    @elements.shift
  end

  def show
    puts @elements
  end
end

class Map
  def initialize
    @kv_pairs = []
  end

  def assign(key, value)
    if keys.include?(key)
      @kv_pairs[index_of(key)][-1] = value
    else
      @kv_pairs.push([key, value])
    end
  end

  def lookup(key)
    keys.include?(key) ? @kv_pairs[index_of(key)].last : nil
  end

  def remove(key)
    @kv_pairs.delete_at(index_of(key)) if keys.include?(key)
  end

  def show
    @kv_pairs.each do |kv_pair|
      key, value = kv_pair
      puts "#{key}: #{value}"
    end
  end

  private

  def keys
    @kv_pairs.map { |kv_pair| kv_pair[0] }
  end

  def index_of(key)
    keys.include?(key) ? keys.index(key) : nil
  end

end
