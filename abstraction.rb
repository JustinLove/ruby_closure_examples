x = class Buffer;
  def delay(&proc)
    result, @saved = saved.call, proc
    result
  end
  def saved; @saved || lambda {}; end
  new
end

x.delay {:fee}
x.delay {:fie}
x.delay {:foe}
x.delay {:fum}
