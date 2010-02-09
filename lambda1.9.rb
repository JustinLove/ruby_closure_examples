RUBY_VERSION

# in 1.8, but returns a lambda
#  instead of a true proc
proc {|a, b| a + b}

# new lambda syntax
plus = ->(a, b) {a + b}

# new .call syntactic sugar
plus.(1,2)
