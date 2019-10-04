class EmploymentApplicationsController < ApplicationController
  before_action :set_employment_application, only: [:show, :update, :destroy, :archive]
  load_and_authorize_resource :except => [:new, :create]
  skip_load_resource only: :update_review

  # GET /employment_applications
  def index
    # EmploymentApplication.first.employment_application_reviews.first.id
    search_result = EmploymentApplicationReview.joins(:employment_application).search(params[:search])

    query = Hash.new
    query[:archived] = nil
    
    if params.has_key?(:location)
      query[:location] = params[:location]
    end
    
    if params.has_key?(:status)
      query[:status] = params[:status]
    else
      query[:status] = "0"
    end
    
    if params.has_key?(:department)
      query[:department] = params[:department]
    end
    
    @employment_application_reviews = search_result.where(query).order("created_at DESC")
    
    @counts = Hash.new
    
    status_query = query.clone
    # remove existing status from query
    status_query.except!(:status)
    # get counts for each status
    EmploymentApplicationReview::STATUS.each do |status|
      status_query[:status] = status[0]
      @counts["status_"+status[0].to_s] = search_result.where(status_query).count
    end
    
    
    location_query = query.clone
    # remove existing location from query
    location_query.except!(:location)
    locations = Location.all.pluck(:name)
    # locations.each do |loc|
    #   loc_name = loc.downcase.gsub(" ", "_")
    #   location_query.except!(:"#{loc_name}")
    # end
    
    # get count of all locations
    @counts["all"] = search_result.where(location_query).count
    
    locations.each do |loc|
      # match location name to symbol syntax
      loc_name = loc.downcase.gsub(" ", "_")
      # add query for loc = true
      location_query[:location] = loc_name
      # get count using query
      @counts[loc_name] = search_result.where(location_query).count
      # remove query for next iteration
      location_query.except!(:location)
    end
    
    
    departments_query = query.clone
    # since we can select multiple departments we want to get counts 
    # if we added a single additional department to the existing query
    departments = [:gymnastics, :dance, :swim, :tag, :hospitality]
    departments.each do |dep|
      if !departments_query.key?(dep)
        # add query for loc = true
        departments_query[:department] = dep
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
    @review = EmploymentApplicationReview.find(params[:id])
    @employment_application = @review.employment_application
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
    
    if verify_recaptcha(model: @employment_application) && @employment_application.save
      departments = ["gymnastics", "dance", "swim", "tag", "hospitality"]
      Location.all.each do |loc|
        loc = loc.name.downcase.gsub(" ", "_")
        if (@employment_application.send loc)
          departments.each do |dep|
            if ((@employment_application.send dep) && !(loc != "folsom" && dep == "swim"))
              review = EmploymentApplicationReview.new
              review.employment_application_id = @employment_application.id
              review.location = loc
              review.department = dep
              if review.save
                EmploymentApplicationMailer.gym_notification(review).deliver_now
              end
            end
          end
        end
      end

      EmploymentApplicationMailer.application_confirmation(@employment_application).deliver_now
      redirect_to thankyou_path, notice: 'Employment Application was successfully submitted.'
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
  
  def update_review
    review = EmploymentApplicationReview.find(params[:id])
    if (params[:employment_application_review].has_key?(:location))
      review.location = params[:employment_application_review][:location].downcase.gsub(" ", "_")
    end
    if (params[:employment_application_review].has_key?(:department))
      review.department = params[:employment_application_review][:department].downcase
    end
    review.status = params[:employment_application_review][:status]
    review.notes = params[:employment_application_review][:notes]
    review.last_edited_by = params[:employment_application_review][:last_edited_by]
    if review.save
      redirect_to employment_applications_url, notice: 'Application Review has been updated.'
    else
      redirect_to review, notice: "Failed to update Application Review"
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
  	@review.archived = true
  	@review.save
    redirect_to employment_applications_url, notice: 'Application Review was Archived. If this was a mistake, contact the webmaster.'
    #check for things archived more than 30 days ago, destroy them all.
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_application      
      @review = EmploymentApplicationReview.find(params[:id])
      @employment_application = @review.employment_application
    end

    # Only allow a trusted parameter "white list" through.
    def employment_application_params
      params.require(:employment_application).permit(:granite_bay, :folsom, :sacramento, :gymnastics, :dance, :swim, :tag, :hospitality, :firstname, :lastname, :middlename, :image, :resume, :phone, :mornings, :saturdays, :previous_experience, :experience_with_children, :previous_office_experience, :customer_service_experience, :reason, :application_date, :email, :position_desired, :over_eighteen, :can_drive, :can_commit_one_year, :expected_pay, :desired_hours, :date_available, :job_requirements_response, :high_school_year, :high_school_graduation_year, :high_school_name, :college_year, :college_graduation_year, :college_name, :college_degree, :hobbies, :continuing_education, :do_not_contact_employer, :do_not_contact_reason, :convicted, :convictions, :interview_date, :interviewed_by, address_attributes: [:street, :city, :state, :zip], employment_histories_attributes: [:company_name, :supervisor_name, :job_title, :description, :phone, :start_date, :end_date, :reason_for_leaving, address_attributes: [:street, :city, :state, :zip]])
    end
end
