class AbsentsController < ApplicationController
  load_and_authorize_resource :except => [:new, :create]
  # GET /absents
  # GET /absents.json
  def index
    @absents = Absent.joins(:level).joins(:classtype)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @absents }
    end
  end

  # GET /absents/new
  # GET /absents/new.json
  def new
    @absent = Absent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @absent }
    end
  end

  # POST /absents
  # POST /absents.json
  def create
    @absent = Absent.new(params[:absent])

    respond_to do |format|
      if @absent.save
        AbsentMailer.gym_notification(@absent).deliver
        format.html { redirect_to root_path, notice: 'Your absent notification has been submitted.' }
        format.json { render json: absents_path, status: :created, location: @absent }
      else
        format.html { render action: "new" }
        format.json { render json: @absent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absents/1
  # DELETE /absents/1.json
  def destroy
    @absent = Absent.find(params[:id])
    @absent.destroy

    respond_to do |format|
      format.html { redirect_to absents_url }
      format.json { head :no_content }
    end
  end
end
