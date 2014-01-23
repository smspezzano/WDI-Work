class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    # loop over all elements in @internal_arr
    # yield to each element

    # keep track of index and start at 0
    # and while i is less than the length of the array 
    # run each element into the block and 
    # then increase the index by one to move to the next element in the array
    # finally return the array
    ele=0
    while ele < @internal_arr.length
      yield @internal_arr[ele]
      ele += 1
    end
    return @internal_arr
  end

  def map &block
    # because we don't want to change the original array we need to create a new array
    # then we want to run each element of the array into a block
    # assign each element in the array to the variable ele
    # then after passing the variable ele into the block with yield
    # we want to push the result of that into the new array and then return that array
    new_array = []  
    self.each { |ele| new_array << yield(ele)}
      new_array 
  end
 

  def map! &block
    # first keep track of index by assigning variable to zero
    # then start a while loop and continue running it till we meet the end of the array
    # then because we want to change the original array (!) 
    # we set each element in the array equal to the element run into the block
    # then increase the index by one and do it again
    # finally return the array
    ele = 0
    while ele < @internal_arr.length
    @internal_arr[ele] = yield(@internal_arr[ele])
      ele += 1
    end
    @internal_arr
  end
  # tired to use map! with each and not while
  # def map! &block
  #   i = 0
  #   self.each do |ele|
  #     @internal_arr[i] = yield(ele)
  #     i += 1
  #   end
  # @internal_arr
  # end

  # def find &block3
    # here we want to find an item in the array
    # so we start by setting the variable ele to 0 
    # which will start us at the beginning of the array
    # then we enter a while loop to check each element 
    # and stay in the loop until we reach the end of the array
    # in the loop if the element at a given index when push into the array returns true
    # then that means we found the element we were looking for and then we want to return it
    # and end, if not, increase the index by one and try again
    # else if the item is not in the array return nil
  #     ele = 0
  #   while ele < @internal_arr.length
  #     if (yield@internal_arr[ele]) == true
  #       return @internal_arr[ele]
  #     end
  #     ele += 1  
  #   end
  #   return nil
  # end

  # I wanted to try a different find using each and not while
  def find &block
    each do |ele|
      if yield ele
        ele
      end
      nil
    end
  end

 # This is Alex's solution 

  def inject acc=nil, &block
    self.each do |ele|
      if acc.nil?
        acc = @internal_arr[0]
      else
        acc = yield acc, ele
      end
    end
    acc
  end
  

end
