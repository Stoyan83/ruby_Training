def maxx(arr)
  if !arr.kind_of?(Array) || arr.empty?
    return "Please enter an array!"
  end
  max =  -Float::INFINITY
  arr.each do |i|
    max = i if i.is_a?(Numeric) && i > max
  end
  max
end

array = [-1, "-5", -6, 0, 10, 4, -7]
puts maxx(array) # 10

# twice slower with sort

# def maxx(arr)
#   arr.length > 0 ? arr.sort[-1] : nil
# end