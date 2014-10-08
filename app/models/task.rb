class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :image
  
  belongs_to :user
 
  belongs_to :grant
  
  mount_uploader :image, FileUploader
end
