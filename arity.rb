def blarg(&proc)
  range = 1..5
  case proc.arity
  when 1; proc.call(range)
  when 2; proc.call(range.begin, range.end)
  else; proc.call(*range.to_a)
  end
end

blarg {|one| one}
blarg {|one, two| [one,two]}
blarg {|one, two, three| [one, two, three]}
