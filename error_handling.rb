class Blarg
  def initialize(&handler); @handler = handler; end
  def even?(x); @handler.call(x) unless x.even?; end
end

a = Blarg.new {|x| p "#{x} isn't even"}
b = Blarg.new {|x| raise 'hell'}

a.even?(2)
a.even?(3)
b.even?(3)
