class RecitalAdsController < ApplicationController
  before_action :set_recital_ad, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:ad_select]

  before_filter :set_variables

  # GET /recital_ads
  # GET /recital_ads.json
  def index
    @recital_ads = RecitalAd.all.order('created_at')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recital_ads }
    end
  end

  # GET /recital_ads/1
  # GET /recital_ads/1.json
  def show
  end

  # GET /recital_ads/new
  # GET /recital_ads/new.json
  def new
    @recital_ad = RecitalAd.new(recital_ad_type_id: params[:recital_ad_type_id])
  end

  # GET /recital_ads/1/edit
  def edit
  end

  # POST /recital_ads
  # POST /recital_ads.json
  def create
    if @recital_ad.save_with_payment
      RecitalAdMailer.order_confirmation(@recital_ad).deliver
      redirect_to 'http://www.tricksgym.com/recital_ad_order_thank_you.html'
    else
      render :new
    end
  end

  # PUT /recital_ads/1
  # PUT /recital_ads/1.json
  def update
    respond_to do |format|
      if @recital_ad.update(recital_ad_params)
        format.html { redirect_to @recital_ad, notice: 'Recital ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recital_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recital_ads/1
  # DELETE /recital_ads/1.json
  def destroy
    @recital_ad.destroy

    respond_to do |format|
      format.html { redirect_to recital_ads_url }
      format.json { head :no_content }
    end
  end

  def ad_select
    @recital_ad_types = RecitalAdType.all.order('price')
    @recital_ad = RecitalAd.new(params[:recital_ad])
  end

  def set_variables
    super
    @needs_stripe = true
  end

  def order_confirmation
    @recital_ad = RecitalAd.find(params[:id])
  end
  
  def by_year
    @recital_ads = RecitalAd.where('extract(year from created_at) = ?', params[:year])
    @total_sales = RecitalAd.joins(:recital_ad_type).where('extract(year from recital_ads.created_at) = ?', params[:year]).sum("price")
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recital_ad
      @recital_ad = RecitalAd.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recital_ad_params
      params.require(:recital_ad).permit(:title, :body, :recital_ad_type_id, :firstname, :lastname, :email, :stripe_card_token, :image, :pdf_file, :message)
    end
end
