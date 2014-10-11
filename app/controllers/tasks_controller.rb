class TasksController < ApplicationController

  # GET /tasks/1
  # GET /tasks/1.json
  def index
    @tasks = Task.all
  end
 
  def show
    @task = Task.find(params[:id]).sort_by(:id)
    @users = User.where(organization_id: current_user.organization_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @grant = Grant.find_by_id(params[:id])
    # @grant.tasks.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find_by_id(params[:id])
  end
   

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @grant = Grant.find_by_id(@task.grant_id)

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def assign_user
    @task = Task.find_by_id(params[:id])
    
    respond_to do |format|
      if @task.update_attribute('user_id', params[:task][:user_id])
        format.html { redirect_to task_path(@task.id), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
        
  def assign_task
    @oldtasks = User.find_by_id(params[:id]).tasks
    @newtasks = Task.find(params[:task].map(&:to_i))
    
    respond_to do |format|
      if Task.assign_user_to_tasks(@newtasks, @oldtasks, params[:id])
        format.html { redirect_to user_path(params[:id]), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
end
