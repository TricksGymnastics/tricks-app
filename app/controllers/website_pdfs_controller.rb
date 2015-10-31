class WebsitePdfsController < ApplicationController  
  layout 'static'
  load_and_authorize_resource :except => :show

  # GET /website_pdfs
  # GET /website_pdfs.json
  def index
    @website_pdfs = WebsitePdf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @website_pdfs }
    end
  end

  # GET /website_pdfs/1
  # GET /website_pdfs/1.json
  def show
    @website_pdf = WebsitePdf.find_by_file_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @website_pdf }
    end
  end

  # GET /website_pdfs/new
  # GET /website_pdfs/new.json
  def new
    @website_pdf = WebsitePdf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website_pdf }
    end
  end

  # GET /website_pdfs/1/edit
  def edit
    @website_pdf = WebsitePdf.find(params[:id])
  end

  # POST /website_pdfs
  # POST /website_pdfs.json
  def create
    params[:website_pdf][:file_name] = params[:website_pdf][:file_name].tr(" ","_")
    @file = WebsitePdf.find_by_file_name(params[:website_pdf][:file_name])
    if (@file.nil?)
      @website_pdf = WebsitePdf.new(params[:website_pdf])

      respond_to do |format|
        if @website_pdf.save
          format.html { redirect_to @website_pdf, notice: 'Website pdf was successfully created.' }
          format.json { render json: @website_pdf, status: :created, location: @website_pdf }
        else
          format.html { render action: "new" }
          format.json { render json: @website_pdf.errors, status: :unprocessable_entity }
        end
      end
    else
      @website_pdf = WebsitePdf.find(@file.id)

      respond_to do |format|
        if @website_pdf.update_attributes(params[:website_pdf])
          format.html { redirect_to @website_pdf, notice: 'Website pdf was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @website_pdf.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /website_pdfs/1
  # PUT /website_pdfs/1.json
  def update
    @website_pdf = WebsitePdf.find(params[:id])

    respond_to do |format|
      if @website_pdf.update_attributes(params[:website_pdf])
        format.html { redirect_to @website_pdf, notice: 'Website pdf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @website_pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website_pdfs/1
  # DELETE /website_pdfs/1.json
  def destroy
    @website_pdf = WebsitePdf.find(params[:id])
    @website_pdf.destroy

    respond_to do |format|
      format.html { redirect_to website_pdfs_url }
      format.json { head :no_content }
    end
  end
end
