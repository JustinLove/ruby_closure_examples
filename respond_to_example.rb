class Responder
  def method_missing(what, &block)
    @responders ||= {}
    @responders[what] = block
  end
  
  def respond_to
    yield self
  end
  
  def response_for(what)
    @responders[what]
  end
end

types = Responder.new

types.respond_to do |format|
  format.html {'<blink>'}
  format.json {'alert("pwn")'}
end

types.response_for(:html).call
