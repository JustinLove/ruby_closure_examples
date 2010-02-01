x = lambda {|a,b| a + b}

def blarg
  [yield(1,2), yield(3,4)]
end

blarg(x)

blarg(&x)
