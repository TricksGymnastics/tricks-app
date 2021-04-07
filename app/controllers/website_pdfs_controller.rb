class WebsitePdfsController < ApplicationController
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
    @website_pdf = WebsitePdf.where(:file_name => params[:id]).first
  end

  # GET /website_pdfs/new
  # GET /website_pdfs/new.json
  def new
    @website_pdf = WebsitePdf.new
  end

  # GET /website_pdfs/1/edit
  def edit
    @website_pdf = WebsitePdf.find(params[:id])
  end

  # POST /website_pdfs
  # POST /website_pdfs.json
  def create
    params[:website_pdf][:file_name] = params[:website_pdf][:file_name].tr(" ","_")
    @file = WebsitePdf.where(:file_name => params[:website_pdf][:file_name]).first
    if (@file.nil?)
      @website_pdf = WebsitePdf.new(website_pdf_params)

      if @website_pdf.save
        redirect_to @website_pdf, notice: 'Website pdf was successfully created.'
      else
        render :new
      end
    else
      @website_pdf = WebsitePdf.find(@file.id)

      if @website_pdf.update_attributes(website_pdf_params)
        redirect_to @website_pdf, notice: 'Website pdf was successfully updated.'
      else
        render :edit
      end
    end
  end

  # PUT /website_pdfs/1
  # PUT /website_pdfs/1.json
  def update
    @website_pdf = WebsitePdf.find(params[:id])

    respond_to do |format|
      if @website_pdf.update(website_pdf_params)
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


  private
    # Only allow a trusted parameter "white list" through.
    def website_pdf_params
      params.require(:website_pdf).permit(:file, :file_name, :file_new)
    end
end
