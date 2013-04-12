class PromoSlidesController < ApplicationController
  # GET /promo_slides
  # GET /promo_slides.json
  def index
    @promo_slides = PromoSlide.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @promo_slides }
    end
  end

  # GET /promo_slides/1
  # GET /promo_slides/1.json
  def show
    @promo_slide = PromoSlide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @promo_slide }
    end
  end

  # GET /promo_slides/new
  # GET /promo_slides/new.json
  def new
    @promo_slide = PromoSlide.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @promo_slide }
    end
  end

  # GET /promo_slides/1/edit
  def edit
    @promo_slide = PromoSlide.find(params[:id])
  end

  # POST /promo_slides
  # POST /promo_slides.json
  def create
    @promo_slide = PromoSlide.new(params[:promo_slide])

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
    @promo_slide = PromoSlide.find(params[:id])

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
    @promo_slide = PromoSlide.find(params[:id])
    @promo_slide.destroy

    respond_to do |format|
      format.html { redirect_to promo_slides_url }
      format.json { head :no_content }
    end
  end
end
