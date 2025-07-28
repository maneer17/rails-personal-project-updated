class Teacher::CommentsController < ApplicationController
  def destroy
    # Why all of that? The comment was not enough. Comment.find(params[:id])
    @teacher = current_teacher
    @course = @teacher.courses.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to teacher_course_post_comments_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  # mai also, you need to have ensure_teacher_teaches_course here
end
