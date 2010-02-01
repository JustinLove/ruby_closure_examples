def blarg
  [yield(1,2), yield(3,4)]
end

blarg {|a,b| a + b}
