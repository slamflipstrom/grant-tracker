class Upload < ActiveRecord::Base
  attr_accessible  :name
  
  belongs_to :grant
end
