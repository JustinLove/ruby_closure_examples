class Action < Proc
  attr_reader :name
  def initialize(_name = "?", &block)
    super(&block); @name = _name; end
  def to_s; "Action #{name}"; end
end

Proc.new {}

Action.new('blarg') {}
