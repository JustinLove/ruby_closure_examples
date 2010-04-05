cthulhu = class Cthulhu
  def call
    :fnord
  end
  new
end

cthulhu.call

cthulhu[]

class Cthulhu
  alias_method :[], :call
end

cthulhu[]
