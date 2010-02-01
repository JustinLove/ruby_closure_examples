def twice
  [yield(1,2), yield(3,4)]
end

twice {|a,b| a + b}
