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
  
  def enqueue_image
      ImageWorker.perform_async(id, key) if key.present?
    end

    class ImageWorker
      include Sidekiq::Worker
    
      def perform(id, key)
        task = Task.find(id)
        task.key = key
        task.remote_image_url = task.image.direct_fog_url(with_path: true)
        task.save!
        task.update_column(:image_processed, true)
      end
    end
end
