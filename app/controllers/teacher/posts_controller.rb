class Teacher::PostsController < ApplicationController
  expose :teacher, :current_teacher
  expose :course
  expose :post, parent: :course
  expose :posts, from: :course
  before_action :ensure_teacher_teaches_course
  def new
    post.comments.build
  end

  def edit
    post.comments.build if post.comments.empty?
  end

  def create
    respond_to do |format|
      if post.save
        format.html { redirect_to teacher_course_posts_path, notice: t(".notice") }
        format.json { render :show, status: :created, location: post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if post.update(post_params)
        format.html { redirect_to [ :teacher, course, post ], notice: t(".notice") }
        format.json { render :show, status: :ok, location: post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_course_posts_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :course_id, comments_attributes: [ :body, :commenter_type, :commenter_id, :_destroy ])
    end

    def ensure_teacher_teaches_course
      unless course.teacher_id == teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
    end
end
