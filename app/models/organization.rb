class Organization < ActiveRecord::Base
  attr_accessible :name, :users_attributes
  
  has_many :users
  has_many :grants
  
  accepts_nested_attributes_for :users
  
end
