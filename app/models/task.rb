class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :image
  
  belongs_to :user
  belongs_to :grant
 
 validates :name, presence: true
 scope :due_soon, lambda { where(:due => Time.now..(Time.now + 1.week)) }
 
  mount_uploader :image, ImageUploader
  
  def due_date
    due.try(:strftime, "%a, %e %b %Y %l:%M %p")
  end
  
  def due_date=(date)
    self.due = Chronic.parse(date) if date.present?
  end
  
  def assign_task(user_id)
    
  end
  
  def self.assign_user_to_tasks(newtasks, oldtasks, user_id)
    
    oldtasks.each do |o|
      if newtasks.include?(o)
        newtasks.each do |n|
          n.update_attribute('user_id', user_id)
        end
      else
        o.update_attribute('user_id', nil)
      end
    end
    
  end
  
end
