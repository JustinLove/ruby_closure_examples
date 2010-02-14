def thrice(&z)
  return [ z.call(1), z.call(2), z.call(3) ]
end

def r
  return thrice(&lambda {|a| return a}).to_s
end; r

def b
  return thrice(&lambda {|a| break  a}).to_s
end; b

def n
  return thrice(&lambda {|a| next   a}).to_s
end; n

def x
  return thrice(&lambda {|a|        a}).to_s
end; x
