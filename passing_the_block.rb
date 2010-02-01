plus = lambda {|a,b| a + b}

def twice
  [yield(1,2), yield(3,4)]
end

twice(plus)

twice(&plus)
