1.method(:+).unbind.class

Fixnum.instance_method(:+).bind(1).class

Fixnum.instance_method(:+).bind(1).call(2)
