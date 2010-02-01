def even(x)
  yield(x) unless x.even?
end

even(2) {|x| p "#{x} isn't even"}
even(3) {|x| p "#{x} isn't even"}

even(3) {|x| raise 'hell'}

errorHandler = lambda {|x| p 'handled'}
even(3, &errorHandler);
