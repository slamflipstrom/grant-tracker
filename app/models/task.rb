class Task < ActiveRecord::Base
  attr_accessible :description, :due_date, :name, :image
  
  belongs_to :user
  belongs_to :grant
 
 validates :name, presence: true
 scope :due_soon, lambda { where(:due => Time.now..(Time.now + 1.week)) }
 
  mount_uploader :image, ImageUploader
  
  # Formats due date for editing task.
  #
  def due_date
    due.localtime.try(:strftime, "%b %e %Y, %l:%M %p")
  end
  
  # Formats due date for showing task in views.
  #
  def pretty_due
    due.localtime.try(:strftime, "%a, %e %b %Y %l:%M %p")
  end
  
  # Sets due date for Task.
  #
  def due_date=(date)
    self.due = Chronic.parse(date) if date.present?
  end
  
  # Assigns multiple tasks to user.
  # newtasks = Array of updated tasks
  # oldtasks = Array of previously assigned tasks
  # user_id = id of User to assign task to
  #
  def self.assign_user_to_tasks(newtasks, oldtasks, user_id)
    if oldtasks.length > 0
      oldtasks.each do |o|
        if newtasks.include?(o)
          newtasks.each do |n|
            n.update_attribute('user_id', user_id.to_i)
          end
        else
          o.update_attribute('user_id', nil)
        end
      end
    else
      newtasks.each do |n|
        n.update_attribute('user_id', user_id.to_i)
      end
    end
  end
  
end
