class Grant < ActiveRecord::Base
  attr_accessible :name
  
  has_many :tasks
  
  belongs_to :organization
end
