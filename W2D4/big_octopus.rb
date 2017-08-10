['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishes)
  best_fish = nil
  fishes.each do |fish1|
    fishes.each { |fish2| best_fish = fish2 if fish1.length < fish2.length }
  end
  best_fish
end

def dominant_octopus(fishes)
  merge_sort(fishes).last
end

def clever_octopus(fishes)
  best_fish = ''
  fishes.each { |fish| best_fish = fish if fish.length > best_fish.length }
  best_fish
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

TILES_HASH = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
               "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def slow_dance(direction, direction_array = TILES_ARRAY)
  direction_array.each_with_index { |dir, idx| return idx if direction == dir }
end

def constant_dance(dir, direction_hash = TILES_HASH)
  direction_hash[dir]
end

def merge_sort(fish)
  return fish if fish.length == 1
  mid = fish.length / 2
  merge(fish[0...mid], fish[mid..-1])
end

def merge(left, right)
  merge = []
  until left.empty? && right.empty?
    case left.first <=> right.first
    when -1
      merge << left.shift
    when 1
      merge << right.shift
    when 0
      merge << left.shift
      merge << right.shift
    when nil
      left.empty? ? merge << right.shift : merge << left.shift
    end
  end
  merge
end
