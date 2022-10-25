def pseudo_rand(num)
  srand 1

  fiber = Fiber.new do
    num.times do
      Fiber.yield rand 100
    end
  end
end

n = pseudo_rand(3)
puts n.resume
puts n.resume
puts n.resume