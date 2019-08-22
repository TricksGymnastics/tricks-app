class MakingADifferencesController < ApplicationController
  before_action :set_making_a_difference, only: [:show, :edit, :update, :destroy]

  # GET /making_a_differences
  def index
    @making_a_differences = MakingADifference.all
  end

  # GET /making_a_differences/1
  def show
  end

  # GET /making_a_differences/new
  def new
    @making_a_difference = MakingADifference.new
  end

  # GET /making_a_differences/1/edit
  def edit
  end

  # POST /making_a_differences
  def create
    @making_a_difference = MakingADifference.new(making_a_difference_params)

    if @making_a_difference.save
      redirect_to @making_a_difference, notice: 'Making a difference was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /making_a_differences/1
  def update
    if @making_a_difference.update(making_a_difference_params)
      redirect_to @making_a_difference, notice: 'Making a difference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /making_a_differences/1
  def destroy
    @making_a_difference.destroy
    redirect_to making_a_differences_url, notice: 'Making a difference was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_making_a_difference
      @making_a_difference = MakingADifference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def making_a_difference_params
      params.require(:making_a_difference).permit(:title, :comment, :date, :name)
    end
end
