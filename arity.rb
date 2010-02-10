def range_query(&block)
  range = 1..5
  case block.arity
  when 1; block.call(range)
  when 2;
    block.call(range.begin, range.end)
  else; block.call(*range.to_a)
  end   
end

range_query {|one| one}
range_query {|one, two|
  [one,two]}
range_query {|one, two, three|
  [one, two, three]}
