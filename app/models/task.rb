class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name
  
  belongs_to :user
 
  belongs_to :grant
end
