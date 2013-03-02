require 'spec_helper'

describe Contact do
  it "is valid with a firstname and a lastname" do
    contact = FactoryGirl.build(:contact)
    p contact
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = FactoryGirl.build(:contact, :firstname => nil)
    expect(contact).to have(1).errors_on(:firstname)
  end

  it "is invalid without a lastname" do
    contact = FactoryGirl.build(:contact, :lastname => nil)
    expect(contact).to have(1).errors_on(:lastname)
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:contact, :email => "something@example.com")
    contact = FactoryGirl.build(:contact, :email => "something@example.com")
    expect(contact).to have(1).errors_on(:email)
  end

  it "returns a contacts full name as a string" do
    john = FactoryGirl.build(:contact)
    expect(john.fullname).to eq "John Doe"
  end

  describe "filter last name by letter" do
    before :each do
      @loblaw = FactoryGirl.create(:contact, :lastname => "Loblaw")
      @lawless = FactoryGirl.create(:contact, :lastname => "Lawless")
      @fiend = FactoryGirl.create(:contact, :lastname => "Fiend")
    end

    context "matching letters" do
      it "returns sorted list of contacts by first letter of lastname" do
        expect(Contact.by_letter("L")).to eq [@lawless, @loblaw]
      end
    end

    context "non-matching letters" do
      it "does not include contacts without a matching letter" do
        expect(Contact.by_letter("L")).to_not include @fiend
      end
    end
  end

end