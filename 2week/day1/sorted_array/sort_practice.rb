def sort_array(arr)
    arr.map { |x, y| y <=> x  }
    puts arr
end

sort_array([4,6,2,77,9])