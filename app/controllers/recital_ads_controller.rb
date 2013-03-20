class RecitalAdsController < ApplicationController
  # GET /recital_ads
  # GET /recital_ads.json
  def index
    @recital_ads = RecitalAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recital_ads }
    end
  end

  # GET /recital_ads/1
  # GET /recital_ads/1.json
  def show
    @recital_ad = RecitalAd.find(params[:id])

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
    @recital_ad = RecitalAd.find(params[:id])
  end

  # POST /recital_ads
  # POST /recital_ads.json
  def create
    @recital_ad = RecitalAd.new(params[:recital_ad])

    respond_to do |format|
      if @recital_ad.save
        format.html { redirect_to @recital_ad, notice: 'Recital ad was successfully created.' }
        format.json { render json: @recital_ad, status: :created, location: @recital_ad }
      else
        format.html { render action: "new" }
        format.json { render json: @recital_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recital_ads/1
  # PUT /recital_ads/1.json
  def update
    @recital_ad = RecitalAd.find(params[:id])

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
    @recital_ad = RecitalAd.find(params[:id])
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
end
