require 'rubygems'
require 'spec'

describe "First Class Functions" do
  it "may be named by variables" do
    x = lambda {:soul}
    x.call.should == :soul
  end

  it "may be stored in data structures" do
    x = [lambda {:soul}]
    x.first.call.should == :soul
  end

  it "may be passed as an argument" do
    def swallow(x)
      x.call.should == :soul
    end
    swallow(lambda {:soul})
  end

  it "may be returned as a result" do
    def well
      lambda {:soul}
    end
    well.call.should == :soul
  end
end