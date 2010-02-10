class CardGame
  def shuffle; end
  def deal; end
  def play(&block)
    instance_eval(&block)
  end
end

game = CardGame.new

game.play do
  shuffle
  deal
end

game.play do
  @danger = 'Oops!'
  'nothing to see here?'
end

game.instance_variables
