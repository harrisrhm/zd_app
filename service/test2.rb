require 'json'
require 'open-uri'
require "httparty"
require 'zendesk_api'

# HTTParty.get("http://dataineed.com/data.json")
# JSON.parse(response.body)


# auth = {
#   Authorization: Basic 6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm,
# }
# options = { basic_auth: auth }
# result = HTTParty.get("https://harrisrhm.zendesk.com/api/v2/tickets.json", options)
# p result

# Authorization: Bearer '6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm'


# uri = URI("https://harrisrhm.zendesk.com/api/v2/tickets.json")
# auth = {
#     Authorization: Bearer '6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm'
# }

# http = Net::HTTP.new(uri.host, uri.port)
# response = http.get(uri, auth)
# p response

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

# description = one.select { |ticket| ticket["description"] }[0] ||= {}
# hash = []
# hash.push({ "description" => description })
# puts hash
zendesk_client = ZendeskService.new().get_client
# tickets = zendesk_client.tickets.page(1).per_page(25)
# next_page = tickets.next
ticket = zendesk_client.tickets.to_a
ticket.each do |ticket|
    puts "ticketID: #{ticket["id"]}, Requester: #{ticket["requester"]}, description: #{ticket["description"]}, status: #{ticket["status"]}"
end


# zendesk_client.tickets.all! do |resource|
#    p resource["id"]
#    p resource["requester"]
# end