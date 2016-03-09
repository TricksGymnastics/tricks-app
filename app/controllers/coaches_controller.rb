class CoachesController < ApplicationController

  load_and_authorize_resource :except => [:type, :loc]
  helper "errors"
  

  def index
    @coaches = Coach.joins(:locations).location_search(params[:location]).uniq.sort_by(&:firstname)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coaches }
    end
  end

  def show
    @coach_levels = Coach.includes(:levels).find(params[:id]).levels.group_by(&:classtype_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coach }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coach }
    end
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @coach.update_attributes(params[:coach].permit(:image, :firstname, :lastname, :gender, :location_ids, :level_ids, :classtype_ids, :experience, :fav_event, :fav_skill, :fav_food, :disney_char, :advice, :birthdate, :startdate, :remove_image, :strengths, :current_employee))
        format.html { redirect_to @coach, notice: 'Coach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coach.destroy
    respond_to do |format|
      format.html { redirect_to coaches_url }
      format.json { head :no_content }
    end
  end

  # this is bugged because of the name "Classtype"... no longer used anywhere
  def type
    @coaches = Coach.includes(:classtypes).where(classtypes: {name: params[:name]}).sort_by(&:firstname)
  end

  def loc
    # Gives an array full of all coaches that work at the location specified in the url
    @coaches_by_location = Coach.includes(:locations).where(locations: {name: params[:name]}).sort_by(&:firstname)
  end

  def past_employees
    @past_employees = Coach.where(:current_employee => false).all
  end

end
