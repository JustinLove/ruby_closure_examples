other = class Other
  def callit; yield; end
  def lamb; lambda {self}; end
  new
end

self
other.callit {self}
other.lamb.call
