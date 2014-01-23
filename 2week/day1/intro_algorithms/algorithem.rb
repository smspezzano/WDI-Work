def binary_search(arr, target, start=0, end_arr=arr.length)

	mid_index = (end_arr.to_i-start.to_i)/2 + start.to_i

	mid_element = arr[mid_index]

		if start >= end_arr
			return nil
		elsif mid_element == target
			return mid_index
		elsif mid_element > target
			return binary_search(arr, target, start, mid_index)
		else
			return binary_search(arr, target, (mid_index.to_i + 1), end_arr)
		end		
end

# def binary_search_loop(arr, target, start=0, end_arr=arr.length)

# 	mid_index = (end_arr.to_i-start.to_i)/2 + start.to_i

# 	mid_element = arr[mid_index]

# 		if start >= end_arr
# 			return nil
# 		elsif mid_element == target
# 			return mid_index
# 		elsif mid_element > target
# 			return binary_search(arr, target, start, mid_index)
# 		else
# 			return binary_search(arr, target, (mid_index.to_i + 1), end_arr)
# 		end	
# end
