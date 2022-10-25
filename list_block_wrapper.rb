def wrapper(list, &block)
  list.map.with_index(1) {|value, index| yield(index, value)}
end


puts wrapper(['a', 'b', 'c', 'd', 'e']) {|x, y| "<li>#{x}. #{y}</li>"}