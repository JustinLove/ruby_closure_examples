def adder(a)
  return lambda {|b| a + b}
end

plus1 = adder(1)
plus10 = adder(10)

[ plus1.call(5), plus10.call(5) ]
