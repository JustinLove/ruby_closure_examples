#   bc = BacktraceCleaner.new
#   bc.add_filter   { |line| line.gsub(Rails.root, '') }
#   bc.add_silencer { |line| line =~ /mongrel|rubygems/ }
#   bc.clean(exception.backtrace) # will strip the Rails.root prefix and skip any lines from mongrel or rubygems

class BacktraceCleaner
  def initialize
    @silencers = []
  end
  
  def add_silencer(&block)
    @silencers << block
  end

  def silence(backtrace)
    @silencers.each do |s|
      backtrace = backtrace.reject { |line| s.call(line) }
    end

    backtrace
  end
end

begin
  bc = BacktraceCleaner.new
  bc.add_silencer {|line| line =~ /hope/}
  bc.add_silencer {|line| line =~ /sanity/}
  bc
end

bc.silence <<-GATES
Abandon all hope,
ye who enter here
GATES

