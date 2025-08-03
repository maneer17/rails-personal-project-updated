class Teacher::CommentsController < ApplicationController
  before_action :ensure_teacher_teaches_course
  def destroy
    # Why all of that? The comment was not enough. Comment.find(params[:id])
    @comment = Comment.find(params[:id])
    @post= @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to teacher_course_post_path(@post.course, @post), status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
  def ensure_teacher_teaches_course
      unless @course.teacher_id == current_teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
  end
end
