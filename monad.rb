class Dot
  def initialize(n)
    @value = case n
    when Dot; n.to_s
    else '.' * n
    end
  end

  def bind
    self.class.new(yield @value.size)
  end
  
  def to_s
    @value
  end
end

def liftM2(&f)
  lambda do |ma, mb|
    ma.bind do |a|
      mb.bind do |b|
        f.call(a, b)
      end
    end
  end
end

def lever(args, margs, f)
  return f.call(*args) if margs.empty?
  margs.first.bind do |x|
    lever(args+[x], margs[1..-1], f)
  end
end

def lift(&f)
  lambda do |*margs|
    lever([], margs, f)
  end
end

plus = lambda {|a, b| a + b}
mplus = lift(&plus)

mplus.call Dot.new(2), Dot.new(3)
