require 'rubygems'
require 'rack'

app = lambda {|env|
  [200, {'ContentType' => 'text/plain'},
    Time.now.to_s]
}

rack = Rack::MockRequest.new(app)

rack.request.body

sleep 2

rack.request.body
