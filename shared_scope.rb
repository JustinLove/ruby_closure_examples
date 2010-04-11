def hidden_number
  a = 0
  return [
    lambda {|b| a = a + b}, 
    lambda {|b| a *= b} ]
end

plus, times = hidden_number

times.call(2)
plus.call(1)
plus.call(5)
times.call(3)
