class TricksUCategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @categories = TricksUCategory.all
  end

  def show
  end

  def new
    @category = TricksUCategory.new
  end

  def edit
  end

  def create
    @category = TricksUCategory.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to tricks_u_categories_path }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to tricks_u_categories_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = TricksUCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:tricks_u_category).permit(:title, :weight, :hidden)
    end

end
