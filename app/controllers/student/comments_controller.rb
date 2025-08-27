class Student::CommentsController < ApplicationController
  expose :course
  expose :post, parent: :course
  expose :comment, parent: :post
  before_action :ensure_student_enroll_course

  def create
    if comment.save
      redirect_to student_course_posts_path(course)
    else
      redirect_to student_course_posts_path(course), alert: "Failed: #{comment.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to student_course_post_path(course, post), status: :see_other, notice: t(".notice")  }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commenter_id, :commenter_type)
  end
  def ensure_student_enroll_course
    unless current_student.student_courses.where(course_id: course.id).exists?
      redirect_to select_student_courses_path, notice: t(".notice")
    end
  end
end
