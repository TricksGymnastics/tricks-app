class EmploymentApplicationsController < ApplicationController
  before_action :set_employment_application, only: [:show, :edit, :update, :destroy]

  # GET /employment_applications
  def index
    @employment_applications = EmploymentApplication.all
      
    if params.has_key?(:location)
      @employment_applications = EmploymentApplication.where(:"#{params[:location]}" => true)
    end
    
    departments = ['gymnastics', 'dance', 'swim', 'tag', 'hospitality']
    departments.each do |dep|
      if params.has_key?(:"#{dep}")
        @employment_applications = @employment_applications.where(:"#{dep}" => true)
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
    
    if @employment_application.save
      redirect_to @employment_application, notice: 'Employment application was successfully created.'
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
      redirect_to employment_applications_url, notice: 'Interview Completed! Application moved to archive.'
    else
      redirect_to app, notice: "Failed to complete the interview"
    end
  end

  # DELETE /employment_applications/1
  def destroy
    @employment_application.destroy
    redirect_to employment_applications_url, notice: 'Employment application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_application
      @employment_application = EmploymentApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employment_application_params
      params.require(:employment_application).permit(:granite_bay, :folsom, :sacramento, :gymnastics, :dance, :swim, :tag, :hospitality, :firstname, :lastname, :middlename, :image, :phone, :mornings, :saturdays, :previous_experience, :experience_with_children, :previous_office_experience, :customer_service_experience, :reason, :application_date, :email, :position_desired, :over_eighteen, :can_drive, :can_commit_one_year, :expected_pay, :desired_hours, :date_available, :job_requirements_response, :high_school_year, :high_school_graduation_year, :high_school_name, :college_year, :college_graduation_year, :college_name, :college_degree, :hobbies, :continuing_education, :do_not_contact_employer, :do_not_contact_reason, :convicted, :convictions, :interview_date, :interviewed_by, address_attributes: [:street, :city, :state, :zip], employment_histories_attributes: [:company_name, :supervisor_name, :job_title, :description, :phone, :start_date, :end_date, :start_pay, :end_pay, :reason_for_leaving, address_attributes: [:street, :city, :state, :zip]])
    end
end
