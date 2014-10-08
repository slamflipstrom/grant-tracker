class Grant < ActiveRecord::Base
  attr_accessible :name, :file
  
  has_many :tasks
  
  belongs_to :organization
  
  has_many :uploads
  
   mount_uploader :file, FileUploader
end
