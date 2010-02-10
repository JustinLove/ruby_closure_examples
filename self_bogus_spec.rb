require 'rubygems'
require 'spec'

describe Spec do
  it "should be able to compare self" do
    self.should == self
  end
end

