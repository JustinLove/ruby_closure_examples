f = File.open('context.rb')
f.read.length
f.closed? # Opps, forgot to close it

File.open('context.rb') do |f|
  $f = f
  f.read.length
end
$f.closed?
