require 'rubygems'
require 'spec'

Y = lambda do |f|
  lambda do |x|
    lambda {|*args| f[ x[x], *args ]}
  end[
    lambda do |x|
      lambda {|*args| f[ x[x], *args ]}
    end]
end

describe "Y combinator" do
  it 'returns a callable' do
    Y[lambda{|f|}].should respond_to :call
  end
  
  it 'runs the function at least once' do
    Y[lambda{|f| :once}].call.should == :once
  end
  
  it 'passes arguments to the wrapped function' do
    Y[lambda{|f, x| x}][:param].should == :param
  end
 
  downer = lambda{|f,n| n == 0 || f[n-1]}
  
  (0..3).each do |i|
    it "handles #{i} levels of recursion" do
      Y[downer][i].should == true
    end
  end
end