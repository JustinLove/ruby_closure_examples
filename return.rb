def blarg; return [ yield(1), yield(2), yield(3) ]; end

def r; return blarg {|a| return a}.to_s; end
def b; return blarg {|a| break  a}.to_s; end
def n; return blarg {|a| next   a}.to_s; end
def x; return blarg {|a|        a}.to_s; end

[ r, b, n, x ]
