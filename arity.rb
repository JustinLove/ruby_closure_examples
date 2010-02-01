def range_query(&proc)
  range = 1..5
  case proc.arity
  when 1; proc.call(range)
  when 2; proc.call(range.begin, range.end)
  else; proc.call(*range.to_a)
  end
end

range_query {|one| one}
range_query {|one, two| [one,two]}
range_query {|one, two, three| [one, two, three]}
