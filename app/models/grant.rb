class Grant < ActiveRecord::Base
  attr_accessible :name, :tasks_attributes, :uploads_attributes # :image
  
  has_many :tasks
  belongs_to :organization
  has_many :uploads
  

  # mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :uploads
end
