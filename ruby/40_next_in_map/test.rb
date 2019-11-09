




result = (1...10).map do |i|
  if i <= 10
    next i
  end

  puts "coucou!"
end

p result
