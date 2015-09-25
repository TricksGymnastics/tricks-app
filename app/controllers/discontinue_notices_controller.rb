class DiscontinueNoticesController < ApplicationController
  load_and_authorize_resource :except => [:new, :create]
  # GET /discontinue_notices
  # GET /discontinue_notices.json
  def index
    @discontinue_notices = DiscontinueNotice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discontinue_notices }
    end
  end

  # GET /discontinue_notices/1
  # GET /discontinue_notices/1.json
  def show
    @discontinue_notice = DiscontinueNotice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discontinue_notice }
    end
  end

  # GET /discontinue_notices/new
  # GET /discontinue_notices/new.json
  def new
    @discontinue_notice = DiscontinueNotice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discontinue_notice }
    end
  end

  # GET /discontinue_notices/1/edit
  def edit
    @discontinue_notice = DiscontinueNotice.find(params[:id])
  end

  # POST /discontinue_notices
  # POST /discontinue_notices.json
  def create
    @discontinue_notice = DiscontinueNotice.new(params[:discontinue_notice])

    respond_to do |format|
      if @discontinue_notice.save
        format.html { redirect_to forms_path, notice: 'Notice to Discontinue was successfully submitted.' }
        format.json { render json: @discontinue_notice, status: :created, location: @discontinue_notice }
      else
        format.html { render action: "new" }
        format.json { render json: @discontinue_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discontinue_notices/1
  # PUT /discontinue_notices/1.json
  def update
    @discontinue_notice = DiscontinueNotice.find(params[:id])

    respond_to do |format|
      if @discontinue_notice.update_attributes(params[:discontinue_notice])
        format.html { redirect_to @discontinue_notice, notice: 'Discontinue notice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discontinue_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discontinue_notices/1
  # DELETE /discontinue_notices/1.json
  def destroy
    @discontinue_notice = DiscontinueNotice.find(params[:id])
    @discontinue_notice.destroy

    respond_to do |format|
      format.html { redirect_to discontinue_notices_url }
      format.json { head :no_content }
    end
  end
end
