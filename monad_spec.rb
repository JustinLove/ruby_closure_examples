# Why are we playing with monads?  Mostly because of "Uncle Bob" Martin's
#  "WTF are Monads?" at Chicago Code Camp.
# They also happen to use a lot closures.

require 'spec'

#this is mostly monad stuff; but it usees yield.
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

#Some fun Proc passing in the tests
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

# Brute force version of lift.
# Uses nested closures
# But I wouldn't want a file full of 1, 2, 3, etc.
def liftM2(m, &f)
  lambda do |ma, mb|
    ma.pass do |a|
      mb.pass do |b|
        m.wrap(f.call(a, b))
      end
    end
  end
end

describe "liftM2" do
  it "a two argument function" do
    plus = lambda {|a, b| a + b}
    mplus = liftM2(Dot, &plus)
    mplus.call(Dot.wrap(2), Dot.wrap(3)).should == Dot.wrap(plus.call(2, 3))
  end
end

# Now we're having some real fun.
#   A locally defined closure captures m & f, oh - and itself - for recursion
def lift(m, &f)
  lever = lambda do |args, margs|
    return m.wrap(f.call(*args)) if margs.empty?
    margs.first.pass do |x|
      lever.call(args+[x], margs[1..-1])
    end
  end
  lambda do |*margs|
    lever.call([], margs)
  end
end


shared_examples_for "lifts" do
  it "a one argument function" do
    inc = lambda {|a| a + 1 }
    minc = @lift.call(Dot, &inc)
    minc.call(Dot.wrap(2)).should == Dot.wrap(inc.call(2))
  end

  it "a two argument function" do
    plus = lambda {|a, b| a + b}
    mplus = @lift.call(Dot, &plus)
    mplus.call(Dot.wrap(2), Dot.wrap(3)).should == Dot.wrap(plus.call(2, 3))
  end

  it "a three argument function" do
    cond = lambda {|a, b, c| (a == 0) ? b : c}
    mcond = @lift.call(Dot, &cond)
    mcond.call(Dot.wrap(0), Dot.wrap(1), Dot.wrap(2)).should == Dot.wrap(cond.call(0, 1, 2))
    mcond.call(Dot.wrap(1), Dot.wrap(1), Dot.wrap(2)).should == Dot.wrap(cond.call(1, 1, 2))
  end
end

describe "lift" do
  before :all do
    @lift = method :lift
  end
  
  it_should_behave_like "lifts"
end

# and now for utter madness, I happend to notice that last version
#  fit the pattern for Y combinator, so redefine lift using Y
Y = lambda do |f|
  lambda do |x|
    lambda {|*args| f[ x[x], *args ]}
  end[
    lambda do |x|
      lambda {|*args| f[ x[x], *args ]}
    end]
end

def liftY(m, &f)
  lambda do |*liftargs|
    Y.call(lambda { |continuation, args, margs|
      return m.wrap(f.call(*args)) if margs.empty?
      margs.first.pass do |x|
        continuation.call(args+[x], margs[1..-1])
      end
    }).call([], liftargs)
  end
end

describe "liftY" do
  before :all do
    @lift = method :liftY
  end
  
  it_should_behave_like "lifts"
end
