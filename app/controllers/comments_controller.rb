class CommentsController < ApplicationController
  #before_filter :authorize
  load_and_authorize_resource :except => :random_comment
  helper_method :sort_column, :sort_direction 
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
      format.js # index.js.erb 
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    respond_to do |format|
      if @comment.save
        #format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.html { redirect_to comments_path(@comments), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  def random_comment
    @comment = Comment.where(score: 7..10).sample(n=6)
    @comment.to_json(only: [:comment, :name])

    

    respond_to do |format|
      format.html {if current_user.nil?
          render :layout => "random_comment"
        else
         render :layout => "application"
        end}
        
      format.json { render json: @comment, only: [:comment, :name]}
    end
  end

  private

  def sort_column
      Comment.column_names.include?(params[:sort]) ? params[:sort] : "score"
  end

  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
