# method to proc
1.method(:+).to_proc

# proc to method
$x = lambda {'x: ' + to_s}
$x.call

class Blarg; define_method(:bleep, &$x); end
Blarg.new.bleep
