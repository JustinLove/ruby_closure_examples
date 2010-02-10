def twice(&block)
  [block.call(1,2),
   block.call(3,4)]
end

twice {|a,b| a + b}
