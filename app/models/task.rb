class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :image
  
  belongs_to :user
  belongs_to :grant
 
  mount_uploader :image, ImageUploader
  
  def due_date
    due.try(:strftime, "%a, %e %b %Y %l:%M %p")
  end
  
  def due_date=(date)
    self.due = Chronic.parse(date) if date.present?
  end
  
  def assign_user(user_id)
    self.each do |t|
      t.update_attribute('user_id', user_id)
    end
  end
  

end
