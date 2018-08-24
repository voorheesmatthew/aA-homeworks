# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map

  def initialize
    @ivar = []
  end

  def set(key, value)
    keys = []
    values = []
    @ivar.each_index do |i|
      keys << @ivar[i][0]
      values << @ivar[i][1]
    end
    if keys.include?(key)
      #search for correct array
      @ivar.each_index do |i|
        @ivar[i] << value if @ivar[i][0] == key
      end
    else
      @ivar << [key, value]
    end
  end

  def get(key)
    @ivar.each_index do |i|
      return @ivar[i][1..-1] if @ivar[i][0] == key
    end
    nil
  end

  def delete(key)
    @ivar.reject! { |el| el[0] == key  }
  end

  def show
    @ivar
  end

end
