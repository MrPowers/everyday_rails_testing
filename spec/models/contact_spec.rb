require 'spec_helper'

describe Contact do
  it "is valid with a firstname and a lastname" do
    contact = Contact.new(:firstname => "Matt", :lastname => "Powers")
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = FactoryGirl.build(:contact, :firstname => nil)
    expect(contact). to have(1).errors_on(:firstname)
  end

  it "is invalid without a lastname" do
    contact = Contact.new(:firstname => "Matt")
    expect(contact). to have(1).errors_on(:lastname)
  end

  it "is invalid with a duplicate email address" do
    Contact.create(
      :firstname => "Bob", 
      :lastname => "Loblaw", 
      :email => "bob@loblaw.com"
    )
    Contact.find_by_firstname("Bob").should_not be_nil
    contact = Contact.create(
      :firstname => "Some", 
      :lastname => "Person", 
      :email => "bob@loblaw.com"
    )
    expect(contact).to have(1).errors_on(:email)
  end

  it "returns a contacts full name as a string" do
    sally = Contact.create(
      :firstname => "Sally", 
      :lastname => "Loblaw", 
      :email => "sally@example.com"
    )
    expect(sally.fullname).to eq "Sally Loblaw"
  end

  describe "filter last name by letter" do
    before :each do
      @bob = Contact.create(
        :firstname => "Bob", 
        :lastname => "Loblaw", 
        :email => "bob@loblaw.com"
      )
      @some = contact = Contact.create(
        :firstname => "Some", 
        :lastname => "Person", 
        :email => "bob@loblaw.com"
      )
      @billy = contact = Contact.create(
        :firstname => "Billy", 
        :lastname => "Lawless", 
        :email => "billy@law.com"
      )
    end

    context "matching letters" do
      it "returns sorted list of contacts by first letter of lastname" do
        expect(Contact.by_letter("L")).to eq [@billy, @bob]
      end
    end

    context "non-matching letters" do
      it "does not include contacts without a matching letter" do
        expect(Contact.by_letter("L")).to_not include @some
      end
    end
  end

end