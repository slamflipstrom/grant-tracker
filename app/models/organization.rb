class Organization < ActiveRecord::Base
  attr_accessible :name
  
  has_many :users
  
  has_many :grants
end
