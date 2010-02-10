require 'rubygems'
require 'spec'

describe "self" do
  it "can be passed into an object" do
    other = class Receiver
      def callit; yield; end
      new
    end

    (other.callit {self} == self).should be_true
  end

  it "can be passed out" do
    other = class Transmitter
      def lamb; lambda {self}; end
      new
    end

    other.lamb.call.should == other
  end
end

