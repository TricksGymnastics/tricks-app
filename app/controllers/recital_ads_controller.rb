class RecitalAdsController < ApplicationController
  
  load_and_authorize_resource :except => [:ad_select]

  before_filter :set_variables

  # GET /recital_ads
  # GET /recital_ads.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recital_ads }
    end
  end

  # GET /recital_ads/1
  # GET /recital_ads/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recital_ad }
    end
  end

  # GET /recital_ads/new
  # GET /recital_ads/new.json
  def new
    @recital_ad = RecitalAd.new(recital_ad_type_id: params[:recital_ad_type_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recital_ad }
    end
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
      if @recital_ad.update_attributes(params[:recital_ad])
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
    @recital_ad_types = RecitalAdType.all(:order => 'price')
    @recital_ad = RecitalAd.new(params[:recital_ad])
  end

  def set_variables
    @needs_stripe = true
  end

  def order_confirmation
    @recital_ad = RecitalAd.find(params[:id])
  end
end
