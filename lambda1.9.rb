RUBY_VERSION

# in 1.8, but returns a lambda instead of a true proc
proc {|a, b| a + b}

x = ->(a, b) {a + b} # new lambda syntax

x.(1,2) # new .call syntactic sugar
