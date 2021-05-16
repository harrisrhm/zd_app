require_relative 'ticket_helper'

ticket_helper = TicketHelper.new(
  file_name: "ticket",
  class_name: "Ticket"
)

describe "Ticket", unless: ticket_helper.file_and_class_valid? do
    it '`ticket.rb` file should exist' do 
        expect(ticket_helper.file_exists?).to be(true)
    end

    it '`Ticket` class should be defined' do
        expect(ticket_helper.class_defined?).to be(true)
    end
end

describe '#ticket_id' do
    it 'should return the id of ticket' do
        expect(ticket).to respond_to :ticket_id
    end
end

describe '#requester' do
    it 'should return the requester of ticket' do
        expect(ticket).to respond_to :description
    end
end

describe '#subject' do
    it 'should return the subject of ticket' do
        expect(ticket).to respond_to :subject
    end
end

describe '#description' do
    it 'should return the description of ticket' do
        expect(ticket).to respond_to :description
    end
end

describe '#created_date' do
    it 'should return the created date of ticket' do
        expect(ticket).to respond_to :created_date
    end
end

describe '#created_time' do
    it 'should return the created time of ticket' do
        expect(ticket).to respond_to :created_time
    end
end

describe '#status' do
    it 'should return the status of ticket' do
        expect(ticket).to respond_to :status
    end
end