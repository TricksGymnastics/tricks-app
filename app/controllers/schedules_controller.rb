class SchedulesController < ApplicationController
  
  load_and_authorize_resource :except => [:choose, :fol_gym, :fol_tb, :fol_dance, :fol_swim, :fol_tag, :gb_gym, :gb_tb, :gb_dance, :gb_tag, :sac_gym, :sac_tb, :sac_dance]
  helper_method :sort_column, :sort_direction

  # GET /schedules
  # GET /schedules.json
   def index
    if  params[:sort] == nil
      if params[:time] == nil or params[:time] == ""
        @schedules = Schedule.joins(:level).location_search(params[:location]).level_search(params[:level]).day_search(params[:day]).teacher_search(params[:teacher]).age_search(params[:age]).gender_search(params[:gender]).order("schedules.updated_at DESC")
      else
        @schedules = Schedule.joins(:level).location_search(params[:location]).level_search(params[:level]).day_search(params[:day]).time_search(Time.strptime("01-01-2000 "+ params[:time] +" UTC",'%m-%d-%Y %l:%M %p %Z')).teacher_search(params[:teacher]).age_search(params[:age]).gender_search(params[:gender]).order("schedules.updated_at DESC")
      end
    else
      @schedules = Schedule.joins(:level).location_search(params[:location]).level_search(params[:level]).day_search(params[:day]).teacher_search(params[:teacher]).age_search(params[:age]).gender_search(params[:gender]).order(sort_column + " " + sort_direction)
    end

    

    @schedules_time = []
    Schedule.find(:all, :order => "time ASC").each do |s|
      time = s.time.strftime("%l:%M %p")
      @schedules_time << time
    end

    #add this to the end of the above line to enable pagination ".paginate(:per_page => 15, :page => params[:page])"

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
      format.html { redirect_to schedules_path }
      format.json { head :no_content }
    end
  end




  def by_gym
    @schedules_by_level = Schedule.all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Gymnastics").id)
    render :layout => "layout_for_print_schedule"
  end 





  def gb_gym
    @schedules_by_level = Schedule.where(location: "Granite Bay").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Gymnastics").id)
    render :layout => "layout_for_print_schedule"
  end  

  def gb_tb
    @schedules_by_level = Schedule.where(location: "Granite Bay").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Tumblebunnies").id)
    render :layout => "layout_for_print_schedule"
  end 

  def gb_dance
    @schedules_by_level = Schedule.where(location: "Granite Bay").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Dance").id)
    render :layout => "layout_for_print_schedule"
  end 

  def gb_tag
    @schedules_by_level = Schedule.where(location: "Granite Bay").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("TAG").id)
    render :layout => "layout_for_print_schedule"
  end



  def fol_gym
    @schedules_by_level = Schedule.where(location: "Folsom").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Gymnastics").id)
    @tag_levels = Level.where(classtype_id: Classtype.find_by_name("TAG").id)
    render :layout => "layout_for_print_schedule"
  end  

  def fol_tb
    @schedules_by_level = Schedule.where(location: "Folsom").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Tumblebunnies").id)
    render :layout => "layout_for_print_schedule"
  end  

  def fol_dance
    @schedules_by_level = Schedule.where(location: "Folsom").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Dance").id)
    render :layout => "layout_for_print_schedule"
  end  

  def fol_swim
    @schedules_by_level = Schedule.where(location: "Folsom").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Swim").id)
    render :layout => "layout_for_print_schedule"
  end  

  def fol_tag
    @schedules_by_level = Schedule.where(location: "Folsom").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("TAG").id)
    render :layout => "layout_for_print_schedule"
  end





  def sac_gym
    @schedules_by_level = Schedule.where(location: "Sacramento").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Gymnastics").id)
    render :layout => "layout_for_print_schedule"
  end 
 
  def sac_tb
    @schedules_by_level = Schedule.where(location: "Sacramento").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Tumblebunnies").id)
    render :layout => "layout_for_print_schedule"
  end 
 
  def sac_dance
    @schedules_by_level = Schedule.where(location: "Sacramento").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("Dance").id)
    render :layout => "layout_for_print_schedule"
  end 

  def sac_tag
    @schedules_by_level = Schedule.where(location: "Sacramento").all(:order => 'day, time').group_by(&:level_id)
    @levels_by_type = Level.where(classtype_id: Classtype.find_by_name("TAG").id)
    render :layout => "layout_for_print_schedule"
  end
 



private

  def sort_column
      Schedule.column_names.include?(params[:sort]) ? params[:sort] : "level"
  end

  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
