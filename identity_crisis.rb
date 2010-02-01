game = class CardGame
  def shuffle; end
  def deal; end
  def play(&proc); instance_eval(&proc); end
  new
end

game.play do
  shuffle
  deal
end

game.play do
  @danger = 'Oops!'
  'nothing to see here?'
end

game.instance_variables
