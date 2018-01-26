class LRUCache
  def initialize(size)
    @size = size
    @cache = []
    
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el) #first check if the cache already includes the element
      @cache.delete(el)
      @cache << el
    elsif count >= @size #if the number of things in the cache is greater than the size
      @cache.shift #take the first element out
      @cache << el
    else
      @cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
    nil
  end

  private
  # helper methods go here!

end