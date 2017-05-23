require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello CSP Report! <br /><img src="http://ackintosh.github.io/assets/images/favicon.gif" />'
end
