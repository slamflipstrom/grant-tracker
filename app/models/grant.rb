class Grant < ActiveRecord::Base
  attr_accessible :name, :organization_id
  
  has_many :tasks
  
  belongs_to :organization
end
