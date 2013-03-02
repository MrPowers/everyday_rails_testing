require 'spec_helper'

describe PhoneNumber do

  it "does not allow duplicate work and cell phone numbers per contact" do
    bob = Contact.create(
      :firstname => "Bob", 
      :lastname => "Loblaw", 
      :email => "bob@loblaw.com"
    )
    home_phone = bob.phone_numbers.create(
      :phone_type => "home",
      :number => '123-123-1234' 
    )
    cell_phone = bob.phone_numbers.create(
      :phone_type => "cell",
      :number => '123-123-1234' 
    )
    expect(cell_phone).to be_invalid
  end

  it "allows two contacts to share a phone number" do
    bob = Contact.create(
      :firstname => "Bob", 
      :lastname => "Loblaw", 
      :email => "bob@loblaw.com"
    )
    sally = Contact.create(
      :firstname => "Sally", 
      :lastname => "Loblaw", 
      :email => "sally@example.com"
    )
    bobs_phone = bob.phone_numbers.create(
      :phone_type => "home",
      :number => '123-123-1234' 
    )
    sallys_phone = sally.phone_numbers.create(
      :phone_type => "home",
      :number => '123-123-1234' 
    )
    expect(sallys_phone).to be_valid
  end

  it "phone number initialized with nil is invalid" do
    digits = PhoneNumber.new(
      :phone_type => "home",
      :number => nil
    )
    expect(digits).to be_invalid
  end
end
