class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :phone_type
  belongs_to :contact
  validates :number, :uniqueness => { :scope => :contact_id }
  validates :number, :presence => true
end