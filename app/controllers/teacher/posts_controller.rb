class Teacher::PostsController < ApplicationController
  before_action :set_course
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = @course.posts
  end

  def new
    @post = @course.posts.build
  end

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

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_course_posts_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :course_id)
    end
end
