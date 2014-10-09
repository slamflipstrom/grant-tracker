class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  
  def index
  end
  
  def dashboard
    @org = Organization.includes([:grants, :tasks, :users]).find_by_id(current_user.organization_id)
    
  end
end
