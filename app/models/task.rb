class Task < ActiveRecord::Base
  attr_accessible :description, :due, :name,  :image
  
  belongs_to :user
  belongs_to :grant
  belongs_to :organization
  
  mount_uploader :image, ImageUploader
end
