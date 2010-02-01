def thrice
  return [ yield(1), yield(2), yield(3) ]
end

def r
  return thrice {|a| return a}.to_s
end; r

def b
  return thrice {|a| break  a}.to_s
end; b

def n
  return thrice {|a| next   a}.to_s
end; n

def x
  return thrice {|a|        a}.to_s
end; x
