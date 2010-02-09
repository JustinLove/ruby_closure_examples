plus1 = 1.method(:+)
im = Fixnum.instance_method(:+)

im.bind(1)
im.bind(1).call(2)

plus1.unbind
