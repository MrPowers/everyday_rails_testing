class Message < ActiveRecord::Base
  attr_accessible :email, :message, :name
  validates :email, :presence => true
end
