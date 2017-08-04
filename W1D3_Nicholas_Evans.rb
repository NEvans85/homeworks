ls
def sum_to(int)
  return nil if int <= 0
  return int if int == 1
  int + sum_to(int - 1)
end

# # Test Cases
# sum_to(5)  # => returns 15
# sum_to(1)  # => returns 1
# sum_to(9)  # => returns 45
# sum_to(-8)  # => returns nil

def add_numbers(arr_of_ints)
  return arr_of_ints[0] if arr_of_ints.length <= 1
  arr_of_ints[0] + add_numbers(arr_of_ints[1..-1])
end
#
# # Test Cases
# add_numbers([1,2,3,4]) # => returns 10
# add_numbers([3]) # => returns 3
# add_numbers([-80,34,7]) # => returns -39
# add_numbers([]) # => returns nil

def gamma_fnc(int)
  return nil if int < 1
  return 1 if int <= 2
  (int - 1) * gamma_fnc(int - 1)
end

# # Test Cases
# gamma_fnc(0)  # => returns nil
# gamma_fnc(1)  # => returns 1
# gamma_fnc(4)  # => returns 6
# gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
  return favorite == flavors[0] if flavors.length <= 1
  flavors[0] == favorite || ice_cream_shop(flavors[1..-1], favorite)
end
#
# # Test Cases
# ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end
#
# # Test Cases
# reverse("house") # => "esuoh"
# reverse("dog") # => "god"
# reverse("atom") # => "mota"
# reverse("q") # => "q"
# reverse("id") # => "di"
# reverse("") # => ""
