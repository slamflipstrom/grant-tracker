class Grant < ActiveRecord::Base
  attr_accessible :name, :tasks_attributes
  
  has_many :tasks
  belongs_to :organization
  
  accepts_nested_attributes_for :tasks
  
end
