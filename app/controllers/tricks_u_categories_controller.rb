class TricksUCategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = TricksUCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category }
    end
  end

  def show
    @category = TricksUCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def new
    @category = TricksUCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  def edit
    @category = TricksUCategory.find(params[:id])
  end

  def create
    @category = TricksUCategory.new(params[:tricks_u_category])

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
    @category = TricksUCategory.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:tricks_u_category])
        format.html { redirect_to @category, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = TricksUCategory.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to tricks_u_categories_url }
      format.json { head :no_content }
    end
  end

end
