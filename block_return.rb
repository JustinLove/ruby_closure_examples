def capture(&block)
  return block
end

capture {|a,b| a + b}
