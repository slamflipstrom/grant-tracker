class Grant < ActiveRecord::Base
  attr_accessible :name, :image, :tasks_attributes
  
  has_many :tasks
  belongs_to :organization
  
  accepts_nested_attributes_for :tasks
  
  has_many :uploads
  
   mount_uploader :image, ImageUploader
end
