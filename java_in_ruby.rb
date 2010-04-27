class ISingletonAbstractFactoryFactory
end

class CSingletonAbstractFactoryFactory <
  ISingletonAbstractFactoryFactory
  
  public
  def getFoo()
    return @foo
  end
  
  public 
  def setFoo(foo)
    @foo = foo
  end
end
