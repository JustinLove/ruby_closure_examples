class Blarg
  def shuffle; end
  def deal; end
  def play(&proc); instance_eval(&proc); end
end

(x = Blarg.new).play do
  shuffle
  deal
  @danger = 'Oops!'
end

x.instance_variables
