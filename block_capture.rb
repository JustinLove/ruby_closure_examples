def blarg(&proc)
  [proc.call(1,2), proc.call(3,4)]
end

blarg {|a,b| a + b}
