def mycb(x)
  puts "in mycb"
  if block_given?
    yield
  else
    