class Responder
  def register(t)
    self.class.__send__ :define_method, t do |&block|
      @responders ||= {}
      @responders[t] = block
      self
    end
  end
  
  def respond_to
    yield self
  end
  
  def response_for(t)
    @responders[t]
  end
end

types = Responder.new
types.register :html
types.register :json

types.respond_to do |format|
  format.html {'<blink>'}
  format.json {'alert("pwn")'}
end

types.response_for(:html).call
