class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  
  def index
    @organization = Organization.new
    @organization.users.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end
  
  def dashboard
    @org = Organization.includes([:grants, :tasks, :users]).find_by_id(current_user.organization_id)
    
  end
  
  def create
    @organization = Organization.new(params[:organization])
    
    respond_to do |format|
      if @organization.save
        # Sets Organization's first user to admin.
        @organization.users.first.update_attribute('admin', true)
        
        # Auto logs in Organization's first user upon creation.
        auto_login(@organization.users.first)
        
        format.html { redirect_to dashboard_path, notice: 'Organization was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end
end
