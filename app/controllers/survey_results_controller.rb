class SurveyResultsController < ApplicationController

  load_and_authorize_resource :except => :results_page

  def index
    @survey_results = SurveyResult.all
  end

  def show
    @survey_result = SurveyResult.find(params[:id])
    @survey_taken = Survey.find(@survey_result.survey_id)
    @the_results = JSON.parse(@survey_result.result, :symbolize_names => true)
  end

  def results_page
    @survey_result = SurveyResult.find(params[:id])
    @survey_taken = Survey.find(@survey_result.survey_id)
    @the_results = JSON.parse(@survey_result.result, :symbolize_names => true)
    @score = 0
    @the_results.each do |r|
      @score = @score + r[:weight]
    end
  end

  def new
    @survey_result = SurveyResult.new
    @survey_given = Survey.find(params[:id])
  end

  def create
    @survey_result = SurveyResult.new(params[:survey_result])
    @survey_result.survey_id = params[:survey_taken].to_i
    @survey_taken = Survey.find(@survey_result.survey_id)
    
    @result_array = []
    c = params[:question_count].to_i                  # Determines number of questions on the survey
    1.upto(c) do |i|                                  # Loops through each question
      p = params["question_#{i}"]
      unless p == nil
        eval = eval(p)                                  # Changes param from a sting to a hash
        @result_array << eval                           # Adds the hash to the results array
      end
    end

    @survey_result.result = @result_array.to_json

    respond_to do |format|
      if @survey_result.save
        if @survey_taken.image_result == true
          format.html { redirect_to results_page_path(@survey_result) }
        else
          format.html { redirect_to survey_thank_you_path }
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @survey_result = SurveyResult.find(params[:id])
    @survey_result.destroy

    respond_to do |format|
      format.html { redirect_to survey_results_url }
    end
  end

end
