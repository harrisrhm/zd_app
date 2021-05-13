require 'json'
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