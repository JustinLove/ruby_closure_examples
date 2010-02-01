x = Proc.new {|a,b| [a, b]}

x.call(1) # no warning
x.call(1,2)
x.call(1,2,3) # no warning
x.call(*[1,2])
x.call([1,2]) # procs auto-splat
