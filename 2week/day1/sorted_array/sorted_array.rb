class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = []
    # Fill in the rest of the initialize method here.
    # What should you do with each element of the incoming array?

    # This takes each item in the array and runs it into the add
    # function, which in turn adds each element back into the 
    # array from smallest to biggest
    for i in input_arr
      add(i)
    end  
  end

  def add(new_ele)
    # Hint: Use the Array#insert method.
    # Using the array insert method this method finds the index by

    # using the first_larger_index method to find where that element
    # should be at in the array and then put that element at that index
    @internal_arr.insert(first_larger_index(new_ele), new_ele)
    # raise NotImplementedError.new("You need to implement the add method!")
  end

  def size
    @internal_arr.size
  end

  def [](index)
    @internal_arr[index]
    # raise NotImplementedError.new("You need to implement the [] method!")
  end

  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    # Here I am using a variation of the binary search method
    # but the conditions that make the recursive function end
    # are altered
    # here I find the middle index by dividing the the end index 
    # minus the start index by 2 
    mid_index = (end_ind - start_ind)/2 + start_ind
    # here we return the start index if it is bigger than the end index
    # because that means that it should go at the end because it is a bigger
    # index than the end index
    if start_ind >= end_ind
      return start_ind
    # if the target is less than or equal to the middle index object then set
    # the end index equal to the middle and run the method
    elsif target <= @internal_arr[mid_index] 
      return first_larger_index(target, start_ind, mid_index)
    # else if the target is greater than or equal to the middle index object
    # then set the start to middle plus one and the end is the end index
    else  
      return first_larger_index(target, (mid_index + 1), end_ind)
    end
    # raise NotImplementedError.new("You need to implement the first_larger_index method!")
  end

  def index(target)
  # if the object at the target index is equal to the target 
  # then return the target
   x = first_larger_index(target)
    if @internal_arr[x] == target
      return x
    # else return nil because that means the target is either out of 
    # scope or not in the array
    else
      return nil
    end
   # raise NotImplementedError.new("You need to implement the index method!")
  end
end
