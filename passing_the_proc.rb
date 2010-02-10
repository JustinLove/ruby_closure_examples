plus = lambda {|a,b| a + b}

def twice(x)
  [x.call(1,2),
   x.call(3,4)]
end

twice(plus)

twice(&plus)

twice(plus, &plus)
