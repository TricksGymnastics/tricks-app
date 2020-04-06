class MakingADifferencesController < ApplicationController
   load_and_authorize_resource :except => [:index]
   before_action :set_making_a_difference, only: [:show, :edit, :update, :destroy]
 
  # GET /making_a_differences
  def index
    @children_comments = MakingADifference.where(type_of_life: "Children").page(params[:children_page]).per(8)
    @parents_comments = MakingADifference.where(type_of_life: "Parents").page(params[:parent_page]).per(8)
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
      params.require(:making_a_difference).permit(:comment, :type_of_life, :name)
    end
end
