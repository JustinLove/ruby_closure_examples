SRC = FileList['*.rb']
TXT = SRC.ext('txt')

def post_process(filename)
  text = File.open(filename, "r") do |f|
    text = f.read.gsub(/0x[\da-f]+/, '0x...')
    text
  end
  File.open(filename, "w") do |f|
    f.write(text);
    puts text;
  end
end

file 'lambda1.9.txt' => 'lambda1.9.rb' do |t|
  sh "irb1.9 --prompt xmp #{t.prerequisites} >#{t.name}"
  post_process(t.name)
end

file 'return_locations.txt' => 'return_locations.rb' do |t|
  sh "cp #{t.prerequisites} #{t.name}" 
end

rule '.txt' => '.rb' do |t|
  sh "irb --prompt xmp #{t.prerequisites} >#{t.name}"
  post_process(t.name)
end

task :default => TXT