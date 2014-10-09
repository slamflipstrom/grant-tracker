class Task < ActiveRecord::Base
  attr_accessible :description, :due, :name,  :image
  
  belongs_to :user
  belongs_to :grant
 
  mount_uploader :image, ImageUploader
end
