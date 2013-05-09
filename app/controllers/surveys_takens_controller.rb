class SurveysTakensController < ApplicationController
  # GET /surveys_takens
  # GET /surveys_takens.json
  def index
    @surveys_takens = SurveysTaken.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys_takens }
    end
  end

  # GET /surveys_takens/1
  # GET /surveys_takens/1.json
  def show
    @surveys_taken = SurveysTaken.find(params[:id])
    #@surveys_taken = Survey.find_by_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @surveys_taken }
    end
  end

  # GET /surveys_takens/new
  # GET /surveys_takens/new.json
  def new
    @surveys_taken = SurveysTaken.new
    @survey_given = Survey.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @surveys_taken }
    end
  end

  # GET /surveys_takens/1/edit
  def edit
    @surveys_taken = SurveysTaken.find(params[:id])
  end

  # POST /surveys_takens
  # POST /surveys_takens.json
  def create
    @surveys_taken = SurveysTaken.new(params[:surveys_taken])

    respond_to do |format|
      if @surveys_taken.save
        format.html { redirect_to @surveys_taken, notice: 'Surveys taken was successfully created.' }
        format.json { render json: @surveys_taken, status: :created, location: @surveys_taken }
      else
        format.html { render action: "new" }
        format.json { render json: @surveys_taken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys_takens/1
  # PUT /surveys_takens/1.json
  def update
    @surveys_taken = SurveysTaken.find(params[:id])

    respond_to do |format|
      if @surveys_taken.update_attributes(params[:surveys_taken])
        format.html { redirect_to @surveys_taken, notice: 'Surveys taken was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @surveys_taken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys_takens/1
  # DELETE /surveys_takens/1.json
  def destroy
    @surveys_taken = SurveysTaken.find(params[:id])
    @surveys_taken.destroy

    respond_to do |format|
      format.html { redirect_to surveys_takens_url }
      format.json { head :no_content }
    end
  end

  def survey_submit
    @surveys_taken = SurveysTaken.new(params[:surveys_taken])
  end
end
