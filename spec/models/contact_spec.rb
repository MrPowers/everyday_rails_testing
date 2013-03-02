require 'spec_helper'

describe Contact do
  it "is valid with a firstname and a lastname" do
    contact = Contact.new(:firstname => "Matt", :lastname => "Powers")
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = Contact.new(:lastname => "Powers")
    expect(contact). to have(1).errors_on(:firstname)
  end

  it "is invalid without a lastname" do
    contact = Contact.new(:firstname => "Matt")
    expect(contact). to have(1).errors_on(:lastname)
  end

  it "is invalid with a duplicate email address" do
    
  end
end
