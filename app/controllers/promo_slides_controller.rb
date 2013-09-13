class PromoSlidesController < ApplicationController

  load_and_authorize_resource

  # GET /promo_slides
  # GET /promo_slides.json
  def index
    @live_promo_slides = PromoSlide.where(live: true).all(order: 'sort_order')
    @promo_slides = PromoSlide.where(live: false).all(order: 'updated_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @promo_slides }
    end
  end

  # GET /promo_slides/1
  # GET /promo_slides/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @promo_slide }
    end
  end

  # GET /promo_slides/new
  # GET /promo_slides/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @promo_slide }
    end
  end

  # GET /promo_slides/1/edit
  def edit
  end

  # POST /promo_slides
  # POST /promo_slides.json
  def create
    respond_to do |format|
      if @promo_slide.save
        format.html { redirect_to @promo_slide, notice: 'Promo slide was successfully created.' }
        format.json { render json: @promo_slide, status: :created, location: @promo_slide }
      else
        format.html { render action: "new" }
        format.json { render json: @promo_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /promo_slides/1
  # PUT /promo_slides/1.json
  def update
    respond_to do |format|
      if @promo_slide.update_attributes(params[:promo_slide])
        format.html { redirect_to @promo_slide, notice: 'Promo slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @promo_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promo_slides/1
  # DELETE /promo_slides/1.json
  def destroy
    @promo_slide.destroy

    respond_to do |format|
      format.html { redirect_to promo_slides_url }
      format.json { head :no_content }
    end
  end
end
