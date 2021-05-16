require_relative 'ticket_helper'

ticket_helper = TicketHelper.new(
  file_name: "controller",
  class_name: "Controller"
)

describe "Controller", unless: ticket_helper.file_and_class_valid? do
  it '`controller.rb` file should exist' do
    expect(ticket_helper.file_exists?).to be(true)
  end

  it '`Controller` class should be defined' do
    expect(ticket_helper.class_defined?).to be(true)
  end
end