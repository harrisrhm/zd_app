begin
    require 'ticket'
rescue LoadError
end
  
  class TicketFactory
    def self.build(ticket_id, requester, subject, description, created_date, created_time, status)
      if Ticket.allocate.method(:initialize).arity == 7
        Ticket.new(ticket_id, requester, subject, description, created_date, created_time, status)
      else
        attributes = {
            ticket_id: = ticket_id,
            requester: = requester,
            subject: = subject,
            description: = description,
            created_date: = created_date,
            created_time: = created_time,
            status: = status
        }
        Ticket.new(attributes)
      end
    end
  end