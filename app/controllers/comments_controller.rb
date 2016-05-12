class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
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
    @comment = Comment.new
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
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        #format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        if can? :manage, Comment
          format.html { redirect_to comments_path, notice: 'Comment was successfully created.' }
        else
          format.html { redirect_to "http://www.tricksgym.com/comments.html", notice: 'Comment was successfully created.' }
        end
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
      if @comment.update(comment_params)
        format.html { redirect_to comments_path, notice: 'Comment was successfully updated.' }
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
    render :layout => "random_comment"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:comment, :name, :score, :activity, :email)
    end
    
    def sort_column
        Comment.column_names.include?(params[:sort]) ? params[:sort] : "score"
    end
  
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
