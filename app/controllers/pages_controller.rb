class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  
  def index
  end
  
  def dashboard
    @org = Organization.includes([:grants, :tasks, :users]).find_by_id(current_user.organization_id)
    @tasks = @org.tasks.order(:due)
    @due = @org.tasks.due_soon.order(:due)
    @non_admin_tasks = @org.tasks.where(user_id: current_user.id)
    
  end
end
