class Data
  def open!; end
  def close!; end
  def next!; end
  def more?; end
  def current; end

  def each
    open!
    while more?
      yield current
      next!
    end
    close!
  end

  include Enumerable
end