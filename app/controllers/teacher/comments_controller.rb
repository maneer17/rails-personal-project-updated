class Teacher::CommentsController < ApplicationController
  expose :teacher, :current_teacher
  expose :course
  expose :comment
  before_action :ensure_teacher_teaches_course

  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to teacher_course_post_path(comment.post.course, comment.post), status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
  def ensure_teacher_teaches_course
      unless course.teacher_id == teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
  end
end
