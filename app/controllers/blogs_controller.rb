class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.order(published_at: :desc)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  def my_blogs
    @blogs = current_user.blogs
    @header = "My Blogs"
    render "blogs/index"
  end

  # def edit
  #   @blog = Blog.find(params[:id])
  #   if current_user.id == @blogs
  # end
  # POST /blogs or /blogs.json
  def create
    @blog = current_user.blogs.build(blog_params)
    @blog.published_at = Time.current

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    if @blog.user == current_user
      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
          format.json { render :show, status: :ok, location: @blog }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to blogs_path, alert: "You are not authorized to update this blog."
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    if @blog.user == current_user
      @blog.destroy
      respond_to do |format|
        format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to blogs_path, alert: "You are not authorized to delete this blog."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :image)
    end

    def authorize_user
      unless @blog.user == current_user
        redirect_to blogs_path, alert: "You are not authorized to perform this action."
      end
    end
end
