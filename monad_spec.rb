require 'spec'

class Dot
  def initialize(n)
    @value = case n
    when Dot; n.to_s
    else '.' * n
    end
  end

  def bind
    yield @value.size
  end
  
  def to_s
    @value
  end
  
  def ==(other)
    @value == other.to_s
  end
end

def liftM2(m, &f)
  lambda do |ma, mb|
    ma.bind do |a|
      mb.bind do |b|
        m.new(f.call(a, b))
      end
    end
  end
end

def lever(m, args, margs, f)
  return m.new(f.call(*args)) if margs.empty?
  margs.first.bind do |x|
    lever(m, args+[x], margs[1..-1], f)
  end
end

def lift(m, &f)
  lambda do |*margs|
    lever(m, [], margs, f)
  end
end

plus = lambda {|a, b| a + b}
mplus = lift(Dot, &plus)

mplus.call Dot.new(2), Dot.new(3)

describe Dot do
  describe "Monad Laws" do
    it "1. left associative" do
      id = lambda {|x| Dot.new(x)}
      Dot.new(2).bind(&id).should == id.call(2)
    end
    
    it "2. right associative" do
      id = lambda {|x| Dot.new(x)}
      x = Dot.new(2)
      x.bind(&id).should == x
    end
    
    it "3. chaining" do
      inc = lambda {|x| Dot.new(x + 1)}
      dec = lambda {|x| Dot.new(x * 2)}
      x = Dot.new(0)
      x.bind(&inc).bind(&dec).should == x.bind do |a|
        inc.call(a).bind(&dec)
      end
    end
  end
end
