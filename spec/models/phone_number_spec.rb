require 'spec_helper'

describe PhoneNumber do
  it "does not allow duplicate work and cell phone numbers per contact" do
    work_phone = FactoryGirl.create(:work_phone)
    john = work_phone.contact
    cell_phone = FactoryGirl.build(
      :cell_phone,
      :contact_id => john.id,
      :number => work_phone.number
    )
    expect(cell_phone).to be_invalid
  end

  it "allows two contacts to share a phone number" do
    FactoryGirl.create(:home_phone)
    another_phone_number = FactoryGirl.build(:home_phone)
    expect(another_phone_number).to be_valid
  end

  it "phone number initialized with nil is invalid" do
    home_phone = FactoryGirl.build(:home_phone, :number => nil)
    expect(home_phone).to be_invalid
  end
end
