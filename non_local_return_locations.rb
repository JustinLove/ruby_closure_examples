def thrice
  return [
    yield(1), # <= next goes here
    yield(2), # <= and here
    yield(3)  # <= and here
  ]
end

def caller
  x = # <= break goes here
    thrice {|a| ???? a}
  return x.to_s
end

caller # <= return goes here