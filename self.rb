class Blarg
  def callit; yield; end
  def lamb; lambda {self}; end
end

x = Blarg.new

[ self, x.callit {self}, x.lamb.call ]
