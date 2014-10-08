class Task < ActiveRecord::Base
  attr_accessible :description, :due, :name, :file
  
  belongs_to :user
  belongs_to :grant
  belongs_to :organization
  
  mount_uploader :file, FileUploader
end
