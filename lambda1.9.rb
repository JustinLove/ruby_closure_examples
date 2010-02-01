RUBY_VERSION

# in 1.8, but returns a lambda instead of a true proc
proc {|a, b| a + b}

plus = ->(a, b) {a + b} # new lambda syntax

plus.(1,2) # new .call syntactic sugar
