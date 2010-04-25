def capture(&block)
  return block
end

capture {}

capture {}.class
