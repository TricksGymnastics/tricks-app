class EmploymentApplicationsController < ApplicationController
  before_action :set_employment_application, only: [:show, :edit, :update, :destroy]

  # GET /employment_applications
  def index
    @employment_applications = EmploymentApplication.all
  end

  # GET /employment_applications/1
  def show
  end

  # GET /employment_applications/new
  def new
    @employment_application = EmploymentApplication.new
  end

  # GET /employment_applications/1/edit
  def edit
  end

  # POST /employment_applications
  def create
    @employment_application = EmploymentApplication.new(employment_application_params)
    address = Address.new(address_params)
    address.update_attribute(:addressable, @employment_application)
    
    count = 1
    params.keys.each do |key|
      if key.include? "employment_history_"
        history = EmploymentHistory.new(employment_history_params(count))
        history.update_attribute(:history, @employment_application)
        count += 1
      end
    end
    
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
      params.require(:employment_application).permit(:firstname, :lastname, :middlename, :phone, :mornings, :saturdays, :previous_experience, :experience_with_children, :reason, :application_date, :email, :position_desired, :birthday, :can_drive, :can_commit_one_year, :expected_pay, :desired_hours, :date_available, :job_requirements_response, :high_school_year, :high_school_graduation_year, :high_school_name, :college_year, :college_graduation_year, :college_name, :college_degree, :hobbies, :continuing_education, :do_not_contact_employer, :do_not_contact_reason, :convicted, :convictions, :interview_date, :interviewed_by)
    end
    
    def address_params
       params.require(:address).permit(:street, :city, :state, :zip)
    end
    
    def employment_history_params(id)
       params.require(:"#{'employment_history_'+id.to_s}").permit(:company_name, :supervisor_name, :job_title, :description, :phone, :start_date, :end_date, :start_pay, :end_pay, :reason_for_leaving)
    end
end
