class Component
  @@actions = {}
  def self.define_action(name, &proc); @@actions[name] = proc; end
  def initialize(name); super(); @name = name; end
  def to_proc; @@actions[@name]; end
end

joker = Component.new(:joker)
Component.define_action(:joker) {p 'ha ha'}
3.times(&joker)
