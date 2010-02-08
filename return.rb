def thrice
  [ yield(1), yield(2), yield(3) ]
end

def r
  thrice {|a| return a}.to_s
end; r

def b
  thrice {|a| break  a}.to_s
end; b

def n
  thrice {|a| next   a}.to_s
end; n

def x
  thrice {|a|        a}.to_s
end; x
