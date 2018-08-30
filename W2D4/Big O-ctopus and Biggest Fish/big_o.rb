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














if __FILE__ == $PROGRAM_NAME
  # p clev_oct(fishes)
  p oct_dom(fishes)
  # p sluggish_oct(fishes)
end
