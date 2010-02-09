class Buffer;
  def delay(&proc)
    result, @saved = saved.call, proc
    result
  end
  def saved; @saved || lambda {}; end
end

x = Buffer.new

x.delay {:fee}
x.delay {:fie}
x.delay {:foe}
x.delay {:fum}
