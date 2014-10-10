class Grant < ActiveRecord::Base
  attr_accessible :name, :tasks_attributes, :uploads_attributes
  
  has_many :tasks
  belongs_to :organization
  has_many :uploads
  
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :uploads
  
end
