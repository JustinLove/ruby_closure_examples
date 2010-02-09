f = File.open('context.rb')
f.read.length
# Opps, forgot to close it
f.closed?

File.open('context.rb') do |f|
  $f = f
  f.read.length
end
$f.closed?
