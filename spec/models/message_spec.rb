require 'spec_helper'

describe Message do
  it "messages without an email are invalid" do
    message = FactoryGirl.build(:invalid_message)
    expect(message).to have(1).errors_on(:email)
  end
end
