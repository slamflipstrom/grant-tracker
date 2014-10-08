class Grant < ActiveRecord::Base
  attr_accessible :name, :image
  
  has_many :tasks
  
  belongs_to :organization
  
  has_many :uploads
  
   mount_uploader :image, FileUploader
end
