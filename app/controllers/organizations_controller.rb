class OrganizationsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create, :index]
 
 

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization = Organization.new
    @organization.users.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find_by_id(current_user.organization_id)
  end

  # POST /organizations
  # POST /organizations.json
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

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find_by_id(current_user.organization_id)

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to dashboard_path, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find_by_id(current_user.organization_id)
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end
  
  def new_user
     @org = Organization.find_by_id(current_user.organization_id)
     @user = User.new
  end
  
  def create_user
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        # Sets Organization's first user to admin.
        @user.update_attribute('organization_id', current_user.organization_id)
        UserMailer.registration_confirmation(@user).deliver
        
        format.html { redirect_to dashboard_path, notice: 'User was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
