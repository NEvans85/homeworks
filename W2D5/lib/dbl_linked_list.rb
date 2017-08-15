class DblLinkedList

  attr_accessor :next_obj, :prev_obj
  
  def initialize(next_obj, prev_obj)
    @next_obj = next_obj
    @prev_obj = prev_obj
  end
end
