class Student::CommentsController < ApplicationController
  before_action :ensure_student_enroll_course

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to student_course_posts_path(@comment.post.course)
    else
      Rails.logger.debug @comment.errors.full_messages.inspect  # 👈 add this
      redirect_to student_course_posts_path(Course.find(params[:course_id])), alert: "Failed: #{@comment.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to student_course_post_path(@post.course, @post), status: :see_other, notice: t(".notice")  }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id, :commenter_id, :commenter_type)
  end
  def ensure_student_enroll_course
    unless current_student.student_courses.where(course_id: params[:course_id]).exists?
      redirect_to select_student_courses_path, notice: t(".notice")
    end
  end
end
