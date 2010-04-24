begin
  items = [2.00, 0.99, 19.99]
  discount = 0.10
  discounted = items.map {|price|
    price - price * discount
  }
end

begin
  total = 0
  discounted.each {|price|
    total += price
  }
  total
end
