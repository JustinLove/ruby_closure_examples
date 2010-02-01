plus = Proc.new {|a,b| [a, b]}

plus.call(1) # no warning
plus.call(1,2)
plus.call(1,2,3) # no warning
plus.call(*[1,2])
plus.call([1,2]) # procs auto-splat
