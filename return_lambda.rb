def blarg(&z); return [ z.call(1), z.call(2), z.call(3) ]; end

$z = lambda {|a| return a}
def r; return blarg(&$z).to_s; end
def b; return blarg(&lambda {|a| break  a}).to_s; end
def n; return blarg(&lambda {|a| next   a}).to_s; end
def x; return blarg(&lambda {|a|        a}).to_s; end

p $z.call(1)

[ r, n, x ]
