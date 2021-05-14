require "httpclient"
require "json"
require "open-uri"

result = JSON.parse(open("https://harrisrhm.zendesk.com/api/v2/tickets.json", :http_basic_authentication=>['harris.rhm@gmail.com/token', '6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm']).read)
puts result