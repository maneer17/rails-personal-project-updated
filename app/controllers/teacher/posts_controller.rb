class Teacher::PostsController < ApplicationController
  before_action :set_course
  before_action :set_post, only: %i[ show edit update destroy ]


  # GET /posts or /posts.json
  def index
    @posts = @course.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = @course.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @course.posts.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to teacher_course_posts_path, notice: t(".notice") }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [ :teacher, @course, @post ], notice: t(".notice") }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to teacher_course_posts_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :course_id)
    end
end
