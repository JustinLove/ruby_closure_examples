class Buffer;
  def delay(&block)
    result, @saved = saved.call, block
    result
  end
  def saved; @saved || lambda {}; end
end

x = Buffer.new

x.delay {:fee}
x.delay {:fie}
x.delay {:foe}
x.delay {:fum}
