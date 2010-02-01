def capture(&proc)
  return proc
end

capture {|a,b| a + b}
