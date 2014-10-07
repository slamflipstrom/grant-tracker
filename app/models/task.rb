class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :grant_id, :name, :user_id
  
  belongs_to :user
 
  belongs_to :grant
end
