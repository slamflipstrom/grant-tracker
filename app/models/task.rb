class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :file
  
  belongs_to :user
 
  belongs_to :grant
  
  mount_uploader :file, FileUploader
end
