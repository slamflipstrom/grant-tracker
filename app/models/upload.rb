class Upload < ActiveRecord::Base
  attr_accessible  :name
  
  belongs_to :grant
  
  mount_uploader :image, ImageUploader
end
