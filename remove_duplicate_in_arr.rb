def remove_duplicate(arr)
  arr.each_with_object([]) {|e, arr| arr << e unless arr.include?(e)}
end


arr = [1,2,5,6,5,4,7,1,1,1]
p remove_duplicate(arr)