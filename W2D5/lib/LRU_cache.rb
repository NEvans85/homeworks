class LRUCache
  def initialize(length)
    @contents = []
    @length = length
  end

  def count
    @contents.size
  end

  def add(el)
    if @contents.include?(el)
      @contents.delete(el)
    elsif count >= @length
      @contents.shift
    end
    @contents << el
  end

  def show
    puts @contents
  end

  private
  # helper methods go here!

end
