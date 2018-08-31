class LRUCache
    def initialize(cache_size)
      @cache = Array.new
      @max_cache_size = cache_size
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
        @cache.push(el)
      else
        if @cache.count == @max_cache_size
          @cache.shift
          @cache.push(el)
        else
          @cache.push(el)
        end
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

end
