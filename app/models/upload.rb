class Upload < ActiveRecord::Base
  attr_accessible  :name, :image
  
  belongs_to :grant
  
  mount_uploader :image, ImageUploader
end
