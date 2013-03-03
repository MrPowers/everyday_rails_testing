class Contact < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email
  validates :firstname, :lastname, :presence => true
  validates :email, :uniqueness => true
  validates :phone_numbers, :length => { :is => 3 }
  has_many :phone_numbers

  def fullname
    [self.firstname, self.lastname].join(" ")
  end

  def self.by_letter(letter)
    self.where("lastname LIKE ?", "#{letter}%").order(:lastname)
  end
end
