class DatenightsController < ApplicationController
  load_and_authorize_resource :except => :index

  def index
    @datenight = Datenight.first
  end

  def edit
    @datenight = Datenight.first
  end

  def update
    @datenight = Datenight.first

    respond_to do |format|
      if @datenight.update_attributes(params[:datenight])
        format.html { redirect_to datenights_path, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datenight.errors, status: :unprocessable_entity }
      end
    end
  end
end
