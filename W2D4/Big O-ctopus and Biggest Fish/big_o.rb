# # Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_oct(fishes)
  longest_fish = nil
  fishes.each do |fish|
    fishes.each do |other_fish|
      if fish.length > other_fish.length
        longest_fish = fish if longest_fish == nil
        longest_fish = fish if fish.length > longest_fish.length
      else
        longest_fish = other_fish if longest_fish == nil
        longest_fish = other_fish if other_fish.length > longest_fish.length
      end
    end
  end
  longest_fish
end


# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.

def oct_dom(fishes)
  return fishes.last if fishes.length <= 1

  pivot = fishes.first

  right = fishes[1..-1].select {|el| el.length > pivot.length}
  oct_dom(right)
end

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clev_oct(fishes)
  longest_fish = nil
  fishes.each do |fish|
    longest_fish = fish if longest_fish == nil
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == dir
  end
  nil
end


# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3
# new_tiles_data_structure AKA ntds
def new_tiles_data_structure(arr)
  ntds = {}
  arr.each_with_index {|el,i| ntds[el] = i }
  ntds
end

ntds = new_tiles_data_structure(tiles_array)


def fast_dance(dir, ntds)
  ntds[dir]
end

if __FILE__ == $PROGRAM_NAME

  # p fast_dance("up", ntds)
  ## > 0

  # p fast_dance("right-down", ntds)
  ## > 3

  # p slow_dance("up", tiles_array)
  ## > 0
  #
  # p slow_dance("right-down", tiles_array)
  ## > 3

  # p clev_oct(fishes)
  # p oct_dom(fishes)
  # p sluggish_oct(fishes)
end
