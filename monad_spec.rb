require 'spec'

class Dot
  def initialize(n)
    @value = case n
    when Dot; n.to_s
    else '.' * n
    end
  end
  private_class_method :new
  
  def self.wrap(n)
    new(n)
  end

  def pass
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
    ma.pass do |a|
      mb.pass do |b|
        m.wrap(f.call(a, b))
      end
    end
  end
end

def lever(m, args, margs, f)
  return m.wrap(f.call(*args)) if margs.empty?
  margs.first.pass do |x|
    lever(m, args+[x], margs[1..-1], f)
  end
end

def lift(m, &f)
  lambda do |*margs|
    lever(m, [], margs, f)
  end
end

describe Dot do
  it "has a private constructor" do
    lambda {Dot.new(1)}.should raise_error
  end
  
  describe "Monad Laws" do
    it "1. left associative" do
      id = lambda {|x| Dot.wrap(x)}
      Dot.wrap(2).pass(&id).should == id.call(2)
    end
    
    it "2. right associative" do
      id = lambda {|x| Dot.wrap(x)}
      x = Dot.wrap(2)
      x.pass(&id).should == x
    end
    
    it "3. chaining" do
      inc = lambda {|x| Dot.wrap(x + 1)}
      dec = lambda {|x| Dot.wrap(x * 2)}
      x = Dot.wrap(0)
      x.pass(&inc).pass(&dec).should == x.pass do |a|
        inc.call(a).pass(&dec)
      end
    end
  end
end

describe "lift" do
  it "a one argument function" do
    inc = lambda {|a| a + 1 }
    minc = lift(Dot, &inc)
    minc.call(Dot.wrap(2)).should == Dot.wrap(inc.call(2))
  end

  it "a two argument function" do
    plus = lambda {|a, b| a + b}
    mplus = lift(Dot, &plus)
    mplus.call(Dot.wrap(2), Dot.wrap(3)).should == Dot.wrap(plus.call(2, 3))
  end

  it "a three argument function" do
    cond = lambda {|a, b, c| (a == 0) ? b : c}
    mcond = lift(Dot, &cond)
    mcond.call(Dot.wrap(0), Dot.wrap(1), Dot.wrap(2)).should == Dot.wrap(cond.call(0, 1, 2))
    mcond.call(Dot.wrap(1), Dot.wrap(1), Dot.wrap(2)).should == Dot.wrap(cond.call(1, 1, 2))
  end
end
