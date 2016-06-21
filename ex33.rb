def number_loop(iterator, increment)
  i = 0
  numbers = []

  while i < iterator
    puts "At the top i is #{i}"
    numbers.push(i)

    i += increment
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "

  # remember you can write this 2 other ways?
  numbers.each {|num| puts num}
end

number_loop(10, 2)
