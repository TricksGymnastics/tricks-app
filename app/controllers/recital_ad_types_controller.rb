class RecitalAdTypesController < ApplicationController
  before_action :set_recital_ad_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /recital_ad_types
  # GET /recital_ad_types.json
  def index
  end

  # GET /recital_ad_types/1
  # GET /recital_ad_types/1.json
  def show
  end

  # GET /recital_ad_types/new
  # GET /recital_ad_types/new.json
  def new
    @recital_ad_type = RecitalAdType.new
  end

  # GET /recital_ad_types/1/edit
  def edit
  end

  # POST /recital_ad_types
  # POST /recital_ad_types.json
  def create
    @recital_ad_type = RecitalAdType.new(recital_ad_type_params)
    respond_to do |format|
      if @recital_ad_type.save
        format.html { redirect_to @recital_ad_type, notice: 'Recital ad type was successfully created.' }
        format.json { render json: @recital_ad_type, status: :created, location: @recital_ad_type }
      else
        format.html { render action: "new" }
        format.json { render json: @recital_ad_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recital_ad_types/1
  # PUT /recital_ad_types/1.json
  def update
    respond_to do |format|
      if @recital_ad_type.update(recital_ad_type_params)
        format.html { redirect_to @recital_ad_type, notice: 'Recital ad type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recital_ad_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recital_ad_types/1
  # DELETE /recital_ad_types/1.json
  def destroy
    @recital_ad_type.destroy

    respond_to do |format|
      format.html { redirect_to recital_ad_types_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recital_ad_type
      @recital_ad_type = RecitalAdType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recital_ad_type_params
      params.require(:recital_ad_type).permit(:name, :price, :word_max, :actual_size, :image, :pdf_file)
    end
end
