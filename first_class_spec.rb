require 'rubygems'; require 'spec'
describe "First Class Functions" do
  it "may be named by variables" do
    x = lambda {:foo}
    x.call.should == :foo
  end
  it "may be stored in data structures" do
    x = [lambda {:foo}]
    x.first.call.should == :foo
  end
  it "may be passed as an argument" do
    lambda{|x| x.call.should == :foo}.call(lambda {:foo})
  end
  it "may be returned as a result" do
    lambda{ lambda {:foo} }.call.call.should == :foo
  end
end