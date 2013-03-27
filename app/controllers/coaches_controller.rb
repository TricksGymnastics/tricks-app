class CoachesController < ApplicationController

  load_and_authorize_resource :except => [:type]
  helper "errors"

  # GET /coaches
  # GET /coaches.json
  def index
    @coaches = Coach.joins(:locations).location_search(params[:location]).uniq.sort_by(&:firstname)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coaches }
    end
  end

  # GET /coaches/1
  # GET /coaches/1.json
  def show
    @coach_levels = Coach.includes(:levels).find(params[:id]).levels.group_by(&:classtype_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coach }
    end
  end

  # GET /coaches/new
  # GET /coaches/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coach }
    end
  end

  # GET /coaches/1/edit
  def edit
  end

  # POST /coaches
  # POST /coaches.json
  def create
    respond_to do |format|
      if @coach.save
        format.html { redirect_to @coach, notice: 'Coach was successfully created.' }
        format.json { render json: @coach, status: :created, location: @coach }
      else
        format.html { render action: "new" }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coaches/1
  # PUT /coaches/1.json
  def update
    respond_to do |format|
      if @coach.update_attributes(params[:coach])
        format.html { redirect_to @coach, notice: 'Coach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coaches/1
  # DELETE /coaches/1.json
  def destroy
    @coach.destroy
    respond_to do |format|
      format.html { redirect_to coaches_url }
      format.json { head :no_content }
    end
  end

  def type
    #@coaches = Coach.all.group_by(&:classtype_ids)
    @coaches_by_type = Classtype.includes(:coaches).find_by_name(params[:name]).coaches
    #@coaches = Coach.joins(:classtype).all
  end

  def loc
    # Gives an array full of all coaches that work at the location specified in the url
    @coaches_by_location = Location.includes(:coaches).find_by_name(params[:name]).coaches
  end


end
