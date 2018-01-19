class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

Class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

Class map
  def initialize
    @map = []
  end

  def assign(key,value)
    pair_index = @map.index {|pair| pair[0] == key} #assign new key @first index
    pair_index ? @map[pair_index][1] = value : @map.push([key, value]) #if
    #pair index exists, create an array with key and assign index 1 the value of
    #it. if pair doesn't exist? push a new key value pair
    [key, value] #return key value pair
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0]==key}
    nil
  end

  def remove(key)
    @map.reject! {|pair| pair[0] == key}
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
  end
end
