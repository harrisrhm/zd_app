require 'net/http'
require 'json'
require 'open-uri'

# key = "Lq0mZnIEAUo1PM3VJPKkzSY9KfEqkEhb60kne94o"
# user = "harris.rhm@gmail.com"
# auth = "harris.rhm@gmail.com/token:Lq0mZnIEAUo1PM3VJPKkzSY9KfEqkEhb60kne94o"
# url = "https://harrisrhm.zendesk.com/api/v2/tickets"
# ticket_serialized = URI.open(url).read
# ticket = JSON.parse(ticket_serialized)

# puts ticket


# uri = URI.parse(url)
# result = Net::HTTP.start(uri.host, uri.port) { |http| http.get(uri.path) }
# puts result.code
# puts result.body

# require 'zendesk_api'

# client = ZendeskAPI::Client.new do |config|
#     config.url = "https://harrisrhm.zendesk.com/api/v2"
#     config.username = "harris.rhm@gmail.com"
#     config.token = "6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm"
# end

# p client.tickets.all!
# Lq0mZnIEAUo1PM3VJPKkzSY9KfEqkEhb60kne94o

require 'zendesk_api'

class ZendeskService
    def initialize
        @client = ZendeskAPI::Client.new do |config|
        config.url = "https://harrisrhm.zendesk.com/api/v2"
        config.username = "harris.rhm@gmail.com"
        config.token = "6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm"
        # Optional:
        config.retry = true
        require 'logger'
        config.logger = Logger.new(STDOUT)
    end
  end

  def get_client
    @client
  end

end

zendesk_client = ZendeskService.new().get_client
tickets = zendesk_client.tickets
all = tickets.fetch!
puts all