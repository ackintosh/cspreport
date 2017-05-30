require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

get '/' do
  body = 'Hello CSP Report! <br /><img src="http://ackintosh.github.io/assets/images/favicon.gif" />'
  # see https://www.w3.org/TR/reporting-1/#endpoint-delivery
  # see https://w3c.github.io/webappsec-csp/#directives-reporting
  report_to = {
      url: 'https://cspreport.herokuapp.com/csp-report',
      group: 'cspreport',
      'max-age' => 10886400,
  }
  header = {
      'Report-To' => report_to.to_json,
      'Content-Security-Policy-Report-Only' => 'block-all-mixed-content; report-uri https://cspreport.herokuapp.com/csp-report; report-to cspreport',
  }
  [200, header, body]
end
