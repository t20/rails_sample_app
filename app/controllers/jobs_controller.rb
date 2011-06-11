class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.xml
  def index
    # @jobs = Job.all
    @jobs = Job.find_all_by_user_id(session[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    count = Job.find_all_by_user_id(session[:user_id]).count
    if count >= 7 
      redirect_to ('/jobs', :notice => 'Cannot create more than 7 jobs')
      return
    end
    @job = Job.new(params[:job])
    @job.user_id = session[:user_id]
    respond_to do |format|
      if @job.save
        format.html { redirect_to(@job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Job.find(params[:id])
    if @job.user_id != session[:user_id]
      redirect_to(@job, :notice => 'Invalid Previledges.') 
    else
      respond_to do |format|
        if @job.update_attributes(params[:job])
          format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    if @job.user_id != session[:user_id]
      redirect_to(@job, :notice => 'Invalid Previledges.') 
    else
      @job.destroy
      respond_to do |format|
        format.html { redirect_to(jobs_url) }
        format.xml  { head :ok }
      end
    end
  end
end
