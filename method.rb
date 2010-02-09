def adder(a)
  return lambda {|b| a + b}
end

plus1 = adder(1)
plus1.call(2)

plus1 = 1.method(:+)
plus1.call(2)

plus1.class

im = Fixnum.instance_method(:+)

im.respond_to?(:call)
