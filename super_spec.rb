require 'rubygems'; require 'spec'
module Tattler
  def initialize; super; @pass = true; end; attr_reader :pass
end
class Nice; include Tattler
  def initialize; super; end
end
class Naughty; include Tattler
  def initialize; end;
end;
describe Nice do; it "should initialize modules" do
  Nice.new.pass.should be_true
end; end
describe Naughty do; it "should initialize modules" do
  Naughty.new.pass.should be_true
end; end
