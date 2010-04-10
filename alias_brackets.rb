cthulhu = class Cthulhu
  def call
    "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn"
  end
  new
end

cthulhu.call

cthulhu[]

class Cthulhu
  alias_method :[], :call
end

cthulhu[]
