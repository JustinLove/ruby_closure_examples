require 'rubygems'
require 'spec'

def thrice
  [ yield(1), yield(2), yield(3) ]
end

describe "blocks" do
  it "can use 'return'" do
    def r
      thrice {|a| return a}.to_s
    end
    r.should == '123'
  end

  it "can use 'break'" do
    def b
      thrice {|a| break  a}.to_s
    end
    b.should == '123'
  end

  it "can use 'next'" do
    def n
      thrice {|a| next   a}.to_s
    end
    n.should == '123'
  end

  it "can use implicit return" do
    def i
      thrice {|a|        a}.to_s
    end
    i.should == '123'
  end
end