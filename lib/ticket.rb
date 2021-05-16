class Ticket
    attr_reader :ticket_id, :requester, :subject, :description, :created_date, :created_time, :status
  
    def initialize(attributes = {})
      @ticket_id = attributes[:ticket_id]
      @requester = attributes[:requester]
      @subject = attributes[:subject]
      @description = attributes[:description]
      @created_date = attributes[:created_date]
      @created_time = attributes[:created_time]
      @status = attributes[:status]
    end
    
end