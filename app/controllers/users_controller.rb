class UsersController < ApplicationController
  before_filter :authorize
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction 

  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.js # index.js.erb 
    end
  end

	# GET /users/new
	# GET /users/new.json
	def new
		respond_to do |format|
      	  format.html # new.html.erb
      	  format.json { render json: @user }
      	end
	end

	def create
		if @user.save
			session[:user_id] = @user.id
			redirect_to users_path, notice: "User succesfully created!"
		else
			render "new"
		end
	end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

private

  def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "role"
  end

  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end



end
