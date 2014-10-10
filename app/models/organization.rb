class Organization < ActiveRecord::Base
  attr_accessible :name, :users_attributes, :grants_attributes
  
  has_many :users
  has_many :grants
  has_many :tasks, :through => :grants
  
  validates :name, presence: true
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :grants
  
  
end
