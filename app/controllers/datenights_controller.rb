class DatenightsController < ApplicationController
  layout 'static'
  before_filter :set_variables

  def set_variables
    @bgc_yellow = "#F2E300"
    @bgc_green = "#5FC916"
    @bgc_orange = "#ff9933"
    @bgc_pink = "#ec1e79"
    @bgc_blue = "#223d99"
    @bgc_purple = "#8a09db"

    @twenty_years = "none"
    @jr_login = "none"

    @tricksu_password = false
  end

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
