f = File.open('contain_values.rb')
f.read.length
# Oops, forgot to close it
f.closed?

File.open('contain_values.rb') do |f|
  $f = f
  f.read.length
end
$f.closed?
