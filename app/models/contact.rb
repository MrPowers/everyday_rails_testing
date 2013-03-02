class Contact < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email
  validates :firstname, :lastname, :presence => true
end
