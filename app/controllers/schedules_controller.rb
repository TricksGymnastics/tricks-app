class SchedulesController < ApplicationController
  
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction 

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.joins(:level).location_search(params[:location]).level_search(params[:level]).day_search(params[:day]).time_search(params[:time]).teacher_search(params[:teacher]).age_search(params[:age]).gender_search(params[:gender]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
      format.js # index.js.erb 
    @levels = Level.all
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedules_path, notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to schedules_path, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

private

  def sort_column
      Schedule.column_names.include?(params[:sort]) ? params[:sort] : "level"
  end

  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
