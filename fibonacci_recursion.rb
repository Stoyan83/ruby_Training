def fib(num)
  num <= 1 ? num :  fib(num - 1) + fib(num - 2) 
end
puts fib(17) # 1597