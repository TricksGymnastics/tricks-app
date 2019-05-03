class EmploymentApplicationsController < ApplicationController
  before_action :set_employment_application, only: [:show, :update, :destroy, :archive]
  load_and_authorize_resource :except => [:new, :create]

  # GET /employment_applications
  def index
    search_result = EmploymentApplication.search(params[:search])

    query = Hash.new
    query[:archived] = nil
    
    if params.has_key?(:location)
      query[:"#{params[:location]}"] = true
    end
    
    if params.has_key?(:status)
      query[:status] = params[:status]
    else
      query[:status] = "0"
    end
    
    departments = [:gymnastics, :dance, :swim, :tag, :hospitality]
    departments.each do |dep|
      if params.has_key?(dep)
        query[dep] = true
      end
    end
    
    @employment_applications = search_result.where(query).order("created_at DESC")
    
    
    @counts = Hash.new
    
    status_query = query.clone
    # remove existing status from query
    status_query.except!(:status)
    # get counts for each status
    EmploymentApplication::STATUS.each do |status|
      status_query[:status] = status[1]
      @counts["status_"+status[1].to_s] = search_result.where(status_query).count
    end
    
    
    location_query = query.clone
    # remove existing location from query
    Location.all.each do |loc|
      loc_name = loc.name.downcase.gsub(" ", "_")
      location_query.except!(:"#{loc_name}")
    end
    
    # get count of all locations
    @counts["all"] = search_result.where(location_query).count
    
    Location.all.each do |loc|
      # match location name to symbol syntax
      loc_name = loc.name.downcase.gsub(" ", "_")
      # add query for loc = true
      location_query[:"#{loc_name}"] = true
      # get count using query
      @counts[loc_name] = search_result.where(location_query).count
      # remove query for next iteration
      location_query.except!(:"#{loc_name}")
    end
    
    
    departments_query = query.clone
    # since we an select multiple departments we want to get counts if we added a single additional department to the existing query
    departments.each do |dep|
      if !departments_query.key?(dep)
        # add query for loc = true
        departments_query[dep] = true
        # get count using query
        @counts[dep] = search_result.where(departments_query).count
        # remove query for next iteration
        departments_query.except!(dep)
      else
        @counts[dep] = search_result.where(query).count
      end
    end
    
  end

  # GET /employment_applications/1
  def show
  end

  # GET /employment_applications/new
  def new
    @employment_application = EmploymentApplication.new
    @employment_application.build_address
    @employment_application.employment_histories.build
    @employment_application.employment_histories.each do |history|
      history.build_address
    end
  end

  # POST /employment_applications
  def create
    @employment_application = EmploymentApplication.new(employment_application_params)
    @employment_application.status = 0
    
    if @employment_application.save
      EmploymentApplicationMailer.gym_notification(@employment_application).deliver_now
      EmploymentApplicationMailer.application_confirmation(@employment_application).deliver_now
      redirect_to 'http://www.tricksgym.com/thankyou', notice: 'Employment Application was successfully submitted.'
    else
      render :new
    end
  end

  # PATCH/PUT /employment_applications/1
  def update
    if @employment_application.update(employment_application_params)
      redirect_to @employment_application, notice: 'Employment application was successfully updated.'
    else
      render :edit
    end
  end
  
  def complete_interview
    app = EmploymentApplication.find(params[:id])
    app.interviewed_by = params[:employment_application][:interviewed_by]
    app.comment = params[:employment_application][:comment]
    app.status = params[:employment_application][:status]
    app.interview_date = Time.now
    if app.save
      redirect_to employment_applications_url, notice: 'Interview status has been updated.'
    else
      redirect_to app, notice: "Failed to update the interview"
    end
  end

  # DELETE /employment_applications/1
  def destroy
    @employment_application.destroy
    redirect_to employment_applications_url, notice: 'Employment Application was successfully destroyed.'
  end
  
  def archive
  	@employment_application.archived = true
  	@employment_application.save
    redirect_to employment_applications_url, notice: 'Employment Application was Archived. If this was a mistake, contact the webmaster.'
    #check for things archived more than 30 days ago, destroy them all.
  	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_application
      @employment_application = EmploymentApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employment_application_params
      params.require(:employment_application).permit(:granite_bay, :folsom, :sacramento, :gymnastics, :dance, :swim, :tag, :hospitality, :firstname, :lastname, :middlename, :image, :resume, :phone, :mornings, :saturdays, :previous_experience, :experience_with_children, :previous_office_experience, :customer_service_experience, :reason, :application_date, :email, :position_desired, :over_eighteen, :can_drive, :can_commit_one_year, :expected_pay, :desired_hours, :date_available, :job_requirements_response, :high_school_year, :high_school_graduation_year, :high_school_name, :college_year, :college_graduation_year, :college_name, :college_degree, :hobbies, :continuing_education, :do_not_contact_employer, :do_not_contact_reason, :convicted, :convictions, :interview_date, :interviewed_by, address_attributes: [:street, :city, :state, :zip], employment_histories_attributes: [:company_name, :supervisor_name, :job_title, :description, :phone, :start_date, :end_date, :reason_for_leaving, address_attributes: [:street, :city, :state, :zip]])
    end
end
