def thrice
  return [
    yield(1), # <= next goes here
    yield(2), # <= and here
    yield(3)  # <= and here
  ]
end

def caller
  x = thrice {|a| ???? a} # <= break goes here
  return x.to_s
end

caller # <= return goes here