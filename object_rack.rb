require 'rubygems'
require 'rack'

class App
  def call(env)
    [200,
      {'ContentType' => 'text/plain'},
      Time.now.to_s]
  end
end

rack = Rack::MockRequest.new(App.new)

rack.request.body
