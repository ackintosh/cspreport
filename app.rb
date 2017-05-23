require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  body = 'Hello CSP Report! <br /><img src="http://ackintosh.github.io/assets/images/favicon.gif" />'
  [200, {'Content-Security-Policy-Report-Only' => 'block-all-mixed-content; report-uri https://cspreport.herokuapp.com/csp-report'}, body]
end
