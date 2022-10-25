def convert(arr)
  arr.each_with_object({}) do |item, hash| 
    hash[arr.index(item)] = item
  end
end


arr = %w{test test1 test2}
puts convert(arr)