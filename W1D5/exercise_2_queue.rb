class Queue

  def initialize
    # create ivar to store queue here!
    @ivar = []
  end

  def enqueue(el)
    # adds an element to the back
    @ivar.push(el)
  end

  def dequeue
    # removes one element from the front
    @ivar.shift
  end

  def peek
    # returns, but doesn't remove, the last element in the queue
    @ivar.last
  end

end
