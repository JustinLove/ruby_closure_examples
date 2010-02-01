def twice(&proc)
  [proc.call(1,2), proc.call(3,4)]
end

twice {|a,b| a + b}
